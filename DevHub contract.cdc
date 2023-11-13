// Step 1: Update Portfolio Function
public entry fun update_portfolio(devhub: &mut DevHub, new_portfolio: vector<u8>, id: u64, ctx: &mut TxContext) {
    let user_card = object_table::borrow_mut(&mut devhub.cards, id);
    assert!(tx_context::sender(ctx) == user_card.owner, NOT_THE_OWNER);
    
    let old_value = option::swap_or_fill(&mut user_card.portfolio, string::utf8(new_portfolio));

    // Emit PortfolioUpdated event
    event::emit(
        PortfolioUpdated {
            name: user_card.name,
            owner: user_card.owner,
            new_portfolio: string::utf8(new_portfolio)
        }
    );

    _ = old_value;
}

// Bonus Step: Create PortfolioUpdated Event
struct PortfolioUpdated has copy, drop {
    name: String,
    owner: address,
    new_portfolio: String,
}

// Bonus Step: Update update_portfolio function to emit PortfolioUpdated event
public entry fun update_portfolio(devhub: &mut DevHub, new_portfolio: vector<u8>, id: u64, ctx: &mut TxContext) {
    let user_card = object_table::borrow_mut(&mut devhub.cards, id);
    assert!(tx_context::sender(ctx) == user_card.owner, NOT_THE_OWNER);
    
    let old_value = option::swap_or_fill(&mut user_card.portfolio, string::utf8(new_portfolio));

    // Emit PortfolioUpdated event
    event::emit(
        PortfolioUpdated {
            name: user_card.name,
            owner: user_card.owner,
            new_portfolio: string::utf8(new_portfolio)
        }
    );

    _ = old_value;
}
