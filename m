Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4F73539895E
	for <lists+linux-mips@lfdr.de>; Wed,  2 Jun 2021 14:23:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229758AbhFBMZX (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 2 Jun 2021 08:25:23 -0400
Received: from mail.kernel.org ([198.145.29.99]:57536 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229524AbhFBMZX (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 2 Jun 2021 08:25:23 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id D6EC2613B8;
        Wed,  2 Jun 2021 12:23:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622636620;
        bh=3Yg4IDn6Lcua9+ZP/U4dkhuldGd9dLFvyLSFSHE+nxM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Jsanzx+xUSimntcglNxpQiBb+7xydPRWqpgqJSV8B1WuV5b8375kuB/yxHcl5Uvqp
         /XbUb3YkFgtwXRIvtPq0yX27dL64HFmzkUBBsaywXrPYsgcUNc5bzT7hMBaxcSMNdA
         qPgYedqq/eJseXoyHQqLEc/euLM2HQxWYI9efzpPZEMqCg9OQ87RO2hgkZOx/yTNcw
         ssU3glAFouybzuNNaYwwZHS8QNbBiXzUsLsET7R7xPX5YApsejqcRClOTFqjv133WH
         4MlygOQaK3zafIXJh6zuv5znTE3DsnybnXCDOpju43AgVlHGaz4d3xJF2G8tpsdyhy
         KLaB6Mg9NI9ng==
Received: by pali.im (Postfix)
        id 6219B1534; Wed,  2 Jun 2021 14:23:37 +0200 (CEST)
Date:   Wed, 2 Jun 2021 14:23:37 +0200
From:   Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
To:     Sergio Paracuellos <sergio.paracuellos@gmail.com>
Cc:     "open list:MIPS" <linux-mips@vger.kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        John Crispin <john@phrozen.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Rob Herring <robh+dt@kernel.org>,
        linux-staging@lists.linux.dev,
        Greg KH <gregkh@linuxfoundation.org>,
        NeilBrown <neil@brown.name>,
        Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        linux-pci@vger.kernel.org
Subject: Re: [PATCH 2/4] MIPS: pci: Add driver for MT7621 PCIe controller
Message-ID: <20210602122337.fxwaikulbawwkc2j@pali>
References: <20210515124055.22225-1-sergio.paracuellos@gmail.com>
 <20210515124055.22225-3-sergio.paracuellos@gmail.com>
 <20210531131431.bzsvmefqdyawmeo2@pali>
 <CAMhs-H80=7jctPT70rOmcwcqPw+9iUF84_ZCgGr-TKwJ4eB2Lg@mail.gmail.com>
 <20210531135041.42ovpmbwuc3yfkaw@pali>
 <CAMhs-H_fR5aXJ=diTm-2yhgjjv9S6N6jA-DOZ0K_BnQ4UHHh3Q@mail.gmail.com>
 <CAMhs-H8EwQDvZtzpPn2u_WOWt1wcixOvz5nVZP2miM6j0+P7EA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMhs-H8EwQDvZtzpPn2u_WOWt1wcixOvz5nVZP2miM6j0+P7EA@mail.gmail.com>
User-Agent: NeoMutt/20180716
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wednesday 02 June 2021 14:16:26 Sergio Paracuellos wrote:
> Hi Pali,
> 
> On Mon, May 31, 2021 at 4:19 PM Sergio Paracuellos
> <sergio.paracuellos@gmail.com> wrote:
> >
> > On Mon, May 31, 2021 at 3:50 PM Pali Rohár <pali@kernel.org> wrote:
> > >
> > > On Monday 31 May 2021 15:39:55 Sergio Paracuellos wrote:
> > > > Hi Pali,
> > > >
> > > > Thanks for your comments.
> > > >
> > > > On Mon, May 31, 2021 at 3:14 PM Pali Rohár <pali@kernel.org> wrote:
> > > > >
> > > > > On Saturday 15 May 2021 14:40:53 Sergio Paracuellos wrote:
> > > > > > This patch adds a driver for the PCIe controller of MT7621 SoC.
> > > > > >
> > > > > > Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
> > > > > > ---
> > > > > >  arch/mips/pci/Makefile     |   1 +
> > > > > >  arch/mips/pci/pci-mt7621.c | 624 +++++++++++++++++++++++++++++++++++++
> > > > > >  arch/mips/ralink/Kconfig   |   9 +-
> > > > > >  3 files changed, 633 insertions(+), 1 deletion(-)
> > > > > >  create mode 100644 arch/mips/pci/pci-mt7621.c
> > > > > >
> > > > > > diff --git a/arch/mips/pci/Makefile b/arch/mips/pci/Makefile
> > > > > > index f3eecc065e5c..178c550739c4 100644
> > > > > > --- a/arch/mips/pci/Makefile
> > > > > > +++ b/arch/mips/pci/Makefile
> > > > > > @@ -24,6 +24,7 @@ obj-$(CONFIG_PCI_AR2315)    += pci-ar2315.o
> > > > > >  obj-$(CONFIG_SOC_AR71XX)     += pci-ar71xx.o
> > > > > >  obj-$(CONFIG_PCI_AR724X)     += pci-ar724x.o
> > > > > >  obj-$(CONFIG_PCI_XTALK_BRIDGE)       += pci-xtalk-bridge.o
> > > > > > +obj-$(CONFIG_PCI_MT7621)     += pci-mt7621.o
> > > > > >  #
> > > > > >  # These are still pretty much in the old state, watch, go blind.
> > > > > >  #
> > > > > > diff --git a/arch/mips/pci/pci-mt7621.c b/arch/mips/pci/pci-mt7621.c
> > > > > > new file mode 100644
> > > > > > index 000000000000..fe1945819d25
> > > > > > --- /dev/null
> > > > > > +++ b/arch/mips/pci/pci-mt7621.c
> > > > > ...
> > > > > > +static int mt7621_pcie_enable_ports(struct mt7621_pcie *pcie)
> > > > > > +{
> > > > > > +     struct device *dev = pcie->dev;
> > > > > > +     struct mt7621_pcie_port *port;
> > > > > > +     u8 num_slots_enabled = 0;
> > > > > > +     u32 slot;
> > > > > > +     u32 val;
> > > > > > +     int err;
> > > > > > +
> > > > > > +     /* Setup MEMWIN and IOWIN */
> > > > > > +     pcie_write(pcie, 0xffffffff, RALINK_PCI_MEMBASE);
> > > > > > +     pcie_write(pcie, pcie->io.start, RALINK_PCI_IOBASE);
> > > > > > +
> > > > > > +     list_for_each_entry(port, &pcie->ports, list) {
> > > > > > +             if (port->enabled) {
> > > > > > +                     err = clk_prepare_enable(port->clk);
> > > > > > +                     if (err) {
> > > > > > +                             dev_err(dev, "enabling clk pcie%d\n", slot);
> > > > > > +                             return err;
> > > > > > +                     }
> > > > > > +
> > > > > > +                     mt7621_pcie_enable_port(port);
> > > > > > +                     dev_info(dev, "PCIE%d enabled\n", port->slot);
> > > > > > +                     num_slots_enabled++;
> > > > > > +             }
> > > > > > +     }
> > > > > > +
> > > > > > +     for (slot = 0; slot < num_slots_enabled; slot++) {
> > > > > > +             val = read_config(pcie, slot, PCI_COMMAND);
> > > > > > +             val |= PCI_COMMAND_MASTER;
> > > > > > +             write_config(pcie, slot, PCI_COMMAND, val);
> > > > >
> > > > > Hello! Is this part of code correct? Because it looks strange if PCIe
> > > > > controller driver automatically enables PCI bus mastering, prior device
> > > > > driver initialize itself.
> > > > >
> > > > > Moreover kernel has already function pci_set_master() for this purpose
> > > > > which is used by device drivers.
> > > > >
> > > > > So I think this code can confuse some device drivers...
> > > >
> > > > I agree that we have pci_set_master() to be used in pci device driver
> > > > code. Original controller driver set this bit for enabled slots. Since
> > > > there is no documentation at all for the PCI in this SoC
> > >
> > > I see... this is really a big problem to do any driver development...
> >
> > For sure it is :(.
> >
> > >
> > > > I have
> > > > maintained the setting in the driver in a cleaner way. See original
> > > > driver code and the setting here [0]. There is no other reason than
> > > > that. I am ok with removing this from here and testing with my two
> > > > devices that everything is still ok if having this setting in the pci
> > > > controller driver is a real problem.
> > >
> > > You can run lspci -nnvv with and without PCI_COMMAND_MASTER code and
> > > then compare outputs.
> > >
> > > Device drivers for sure enable PCI_COMMAND_MASTER at the time when it is
> > > needed, so it is possible that there would be no difference in lspci
> > > output.
> >
> > Thanks. I will take this into account when v2 is submitted after more
> > review comments come :).
> 
> I have tested to remove this and check lspci -nnvv output with and
> without PCI_COMMAND_MASTER code and, as you pointed out, there is no
> difference between them. Also, both boards are working without
> regressions at all. So I will remove this code for next version.

Perfect!

> Thanks,
>     Sergio Paracuellos
> >
> > >
> > > > [0]: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git/tree/drivers/staging/mt7621-pci/pci-mt7621.c?h=v4.18#n676
> > > >
> > > > Best regards,
> > > >     Sergio Paracuellos
> > > > >
> > > > > > +             /* configure RC FTS number to 250 when it leaves L0s */
> > > > > > +             val = read_config(pcie, slot, PCIE_FTS_NUM);
> > > > > > +             val &= ~PCIE_FTS_NUM_MASK;
> > > > > > +             val |= PCIE_FTS_NUM_L0(0x50);
> > > > > > +             write_config(pcie, slot, PCIE_FTS_NUM, val);

Could you look also what is doing this code (PCIE_FTS_NUM)? It is marked
as MT specific register. But from this code for me it looks like that it
just access config space of some device and therefore it could be some
standard PCIe register. Just with hardcoded calculated offset.

Could you provide output from lspci -nnvv? So other people could look at
it and maybe we decode what is this code doing and if it is needed.

> > > > > > +     }
> > > > > > +
> > > > > > +     return 0;
> > > > > > +}
