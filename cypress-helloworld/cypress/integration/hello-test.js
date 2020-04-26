describe('My First Test', function() {
    it('Does not do much!', function() {
        cy.visit('http://swf-svi-dkr-sispag15.dev.int.master.lan:8080/nps-anagrafiche-web-console/?lang=en')

        cy.get('table').contains('td', 'Data Entry').click();
        cy.get('table').contains('td', 'Message creation').click();

        cy.get('input.gwt-SuggestBox').type("DefaultMetadata")

        cy.get("div.gwt-PushButton").contains('Select').click();

        const appRef = Math.random().toString(36).substring(2, 15);

        cy.get("textarea.gwt-TextArea").type(appRef);

        cy.get("div.gwt-Label").contains('Application reference').next("input").type(appRef);

        cy.get('div[title="Save message"]').click();

        cy.get("div.html-face").contains('Ok').click();

        //cy.get('table').contains('td', 'Suspended Messages').click();

        //cy.get('table').contains('td', 'Operating Panel').click();

        //cy.get('div[title="Save message"]').click();

        //cy.get("div").contains('Acquisizione File Anagrafiche').next("div img").click();

    });
})
