require 'balance_list'

describe BalanceList do
  let(:balance_1) { BalanceList.new("Manuel", [["Julio", 234], ["Enero", 456], ["Agosto", 123]])}

	describe "#initialize" do
	  context "BalanceList is created" do
		subject { BalanceList.new("Manuel", [["Julio", 234], ["Enero", 456], ["Agosto", 123]]) }

		it(:name) { should_not be_nil }
		it(:balance)  { should_not be_nil }

		it "creates a new BalanceList" do
		  expect(balance_1).to be_an_instance_of BalanceList
		end
	  end
	end

  describe "#name" do
    context "#name is evaluated out of class" do
      it "#name as attr_reader" do
        expect(balance_1.name).to eq("Manuel")
      end
      it  "#name as attr_writer" do
    	  expect{balance_1.name = "Carlos"}.to raise_error(NoMethodError)
      end
    end
  end

  describe "#number_of_balances" do
    context "Checks if number_of_balances is equal to length of list" do
      it "#number_of_balances returns 3 balances" do
        expect(balance_1.number_of_balances).to eq(3)
      end
    end
  end

  describe "#total_balance" do
    context "Checks if total_balance is equal to sum of balances" do
      it "#total_balance returns a total balance of $813" do
        expect(balance_1.total_balance).to eq(813)
      end
    end
  end

  describe "#add_balance" do
    context "Checks if add_balance push a new info in BalanceList" do
      it "#add_balance push a new list '[Marzo, 678]'" do
        balance_1.add_balance(["Marzo", 678])
        expect(balance_1.number_of_balances).to eq(4)
      end
    end
  end

  describe "#current_balance_per_month" do
    context "Checks if current_balance_per_month returns correct message" do
      it "#current_balance_per_month returns string 'Mes: x, Saldo: y'" do
        expect(balance_1.current_balance_per_month).to eq ("Mes: Julio, Saldo: 234")
      end
    end
  end

  describe "#next_balance" do
    context "Checks if next_balance goes to next balance" do
      it "#next_balance returns balance $456" do
        expect(balance_1.next_balance).to eq(456)
      end
    end
    context "Checks if next_balance goes to next balance and current balance is first of list" do
      it "#next_balance advanced three and current balance is index 0 of list" do
        3.times { balance_1.next_balance }
        expect(balance_1.current_balance_per_month).to eq("Mes: Julio, Saldo: 234")
      end
    end
  end
end