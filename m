Return-Path: <linux-mips+bounces-11928-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B4A5C20F49
	for <lists+linux-mips@lfdr.de>; Thu, 30 Oct 2025 16:34:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DCF6918876A6
	for <lists+linux-mips@lfdr.de>; Thu, 30 Oct 2025 15:31:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFEC3261B60;
	Thu, 30 Oct 2025 15:31:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XFFZtvmL"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95BD51E3DCD;
	Thu, 30 Oct 2025 15:31:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761838283; cv=none; b=EVlyInFj16rSFkA28ebRmtwPGuqaN7VtfdQfzwd50/heNMBNfnIk3mNhLZ9J1Zaj6NWlfdXn2vEWTCPsL05aoyOku/VrPrP2hHzlH1rGF0/nYS5CH4QJjgry8tFR80+1UEA7kpv5bqx3PQBxiQvxGlWGB6ssORyJiEmUIB+5JNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761838283; c=relaxed/simple;
	bh=BQKVwpOXmWrg/NEsihgDHlt6ylYYGyKXQx46PtRBNIE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=kyRUy5mOqNplPbJGsENf9vkzwxjZWNeqalneFJrtajCm6WiOJL1BWNLFwUgHfE4RRIBqH3OUYHyxHmWcOvJOB5IIGat7cKDEzpnHGYSWzBSly8MB8Y1/FIiTn7UHb7vbXKyqM4cRZPOm3WPzoy5KiTz+k6Qu6H3IXEJeFqgjZ+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XFFZtvmL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B243BC4CEF1;
	Thu, 30 Oct 2025 15:31:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761838282;
	bh=BQKVwpOXmWrg/NEsihgDHlt6ylYYGyKXQx46PtRBNIE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=XFFZtvmLEsNprsgJCGzuegi3fo25BFtbyMKj/vENFC2KNhctUWYTRw+Ob7OEsPprU
	 6RLUb4R0FtZX5SuSVghhYpA/qbFQ31O0l8MxxjFENM70+PpO+pvJ7y4nJGg6rYCVSF
	 f1E/lZIO2nysDztmIhGwZgf77f/GEc/qLlGLVyRJ1bhbGEqIZ0izCUKouYbBbxhPwB
	 o6ini4Cjp8T6XA47GbGqM/Hcb7VA5Nnpya3KjRlz+AgI/l83VQ/ip73xZZJMLHvUY6
	 PIR6KCA1wLrqDh7IEl3L0xtmv1duKWtzakHljhYnSWSiCzKNnorQ1GlmH1r7EuGObb
	 Pl+A6RH05shBg==
Date: Thu, 30 Oct 2025 10:31:21 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>, x86@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org, linux-mips@vger.kernel.org,
	loongarch@lists.linux.dev, linuxppc-dev@lists.ozlabs.org,
	linux-sh@vger.kernel.org, linux-pci@vger.kernel.org,
	linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/7] MIPS: PCI: Use contextual data instead of global
 variable
Message-ID: <20251030153121.GA1624982@bhelgaas>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <t3la3jte5tia7rh5ftuv5cchrwdxe4cxa2v3g6lxgoh5u6rmcy@hzw7lbke2vac>

On Thu, Oct 30, 2025 at 01:16:12PM +0100, Thierry Reding wrote:
> On Wed, Oct 29, 2025 at 12:46:54PM -0500, Bjorn Helgaas wrote:
> > On Wed, Oct 29, 2025 at 05:33:31PM +0100, Thierry Reding wrote:
> > > From: Thierry Reding <treding@nvidia.com>
> > > 
> > > Pass the driver-specific data via the syscore struct and use it in the
> > > syscore ops.

> > > +++ b/arch/mips/pci/pci-alchemy.c
> > > @@ -33,6 +33,7 @@
> > >  
> > >  struct alchemy_pci_context {
> > >  	struct pci_controller alchemy_pci_ctrl; /* leave as first member! */
> > > +	struct syscore syscore;
> > >  	void __iomem *regs;			/* ctrl base */
> > >  	/* tools for wired entry for config space access */
> > >  	unsigned long last_elo0;
> > > @@ -46,12 +47,6 @@ struct alchemy_pci_context {
> > >  	int (*board_pci_idsel)(unsigned int devsel, int assert);
> > >  };
> > >  
> > > -/* for syscore_ops. There's only one PCI controller on Alchemy chips, so this
> > > - * should suffice for now.
> > > - */
> > > -static struct alchemy_pci_context *__alchemy_pci_ctx;
> > > -
> > > -
> > >  /* IO/MEM resources for PCI. Keep the memres in sync with fixup_bigphys_addr
> > >   * in arch/mips/alchemy/common/setup.c
> > >   */
> > > @@ -306,9 +301,7 @@ static int alchemy_pci_def_idsel(unsigned int devsel, int assert)
> > >  /* save PCI controller register contents. */
> > >  static int alchemy_pci_suspend(void *data)
> > >  {
> > > -	struct alchemy_pci_context *ctx = __alchemy_pci_ctx;
> > > -	if (!ctx)
> > > -		return 0;
> > > +	struct alchemy_pci_context *ctx = data;
> > >  
> > >  	ctx->pm[0]  = __raw_readl(ctx->regs + PCI_REG_CMEM);
> > >  	ctx->pm[1]  = __raw_readl(ctx->regs + PCI_REG_CONFIG) & 0x0009ffff;
> > > @@ -328,9 +321,7 @@ static int alchemy_pci_suspend(void *data)
> > >  
> > >  static void alchemy_pci_resume(void *data)
> > >  {
> > > -	struct alchemy_pci_context *ctx = __alchemy_pci_ctx;
> > > -	if (!ctx)
> > > -		return;
> > > +	struct alchemy_pci_context *ctx = data;
> > >  
> > >  	__raw_writel(ctx->pm[0],  ctx->regs + PCI_REG_CMEM);
> > >  	__raw_writel(ctx->pm[2],  ctx->regs + PCI_REG_B2BMASK_CCH);
> > > @@ -359,10 +350,6 @@ static const struct syscore_ops alchemy_pci_syscore_ops = {
> > >  	.resume = alchemy_pci_resume,
> > >  };
> > >  
> > > -static struct syscore alchemy_pci_syscore = {
> > > -	.ops = &alchemy_pci_syscore_ops,
> > > -};
> > > -
> > >  static int alchemy_pci_probe(struct platform_device *pdev)
> > >  {
> > >  	struct alchemy_pci_platdata *pd = pdev->dev.platform_data;
> > > @@ -480,9 +467,10 @@ static int alchemy_pci_probe(struct platform_device *pdev)
> > >  	__raw_writel(val, ctx->regs + PCI_REG_CONFIG);
> > >  	wmb();
> > >  
> > > -	__alchemy_pci_ctx = ctx;
> > >  	platform_set_drvdata(pdev, ctx);
> > > -	register_syscore(&alchemy_pci_syscore);
> > > +	ctx->syscore.ops = &alchemy_pci_syscore_ops;
> > > +	ctx->syscore.data = ctx;
> > > +	register_syscore(&ctx->syscore);
> > 
> > As far as I can tell, the only use of syscore in this driver is for
> > suspend/resume.
> > 
> > This is a regular platform_device driver, so instead of syscore, I
> > think it should use generic power management like other PCI host
> > controller drivers do, something like this:
> > 
> >   static int alchemy_pci_suspend_noirq(struct device *dev)
> >   ...
> > 
> >   static int alchemy_pci_resume_noirq(struct device *dev)
> >   ...
> > 
> >   static DEFINE_NOIRQ_DEV_PM_OPS(alchemy_pci_pm_ops,
> >                                  alchemy_pci_suspend_noirq,
> >                                  alchemy_pci_resume_noirq);
> > 
> >   static struct platform_driver alchemy_pcictl_driver = {
> >           .probe          = alchemy_pci_probe,
> >           .driver = {
> >                   .name   = "alchemy-pci",
> >                   .pm     = pm_sleep_ptr(&alchemy_pci_pm_ops),
> >           },
> >   };
> > 
> > Here's a sample in another driver:
> > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/pci/controller/cadence/pci-j721e.c?id=v6.17#n663
> 
> I thought so too, but then I looked at the history and saw that it was
> initially regular PM ops and then fixed by using syscore in this commit:
> 
>     commit 864c6c22e9a5742b0f43c983b6c405d52817bacd
>     Author: Manuel Lauss <manuel.lauss@googlemail.com>
>     Date:   Wed Nov 16 15:42:28 2011 +0100
>     
>         MIPS: Alchemy: Fix PCI PM
>     
>         Move PCI Controller PM to syscore_ops since the platform_driver PM methods
>         are called way too late on resume and far too early on suspend (after and
>         before PCI device resume/suspend).
>         This also allows to simplify wired entry management a bit.
>     
>         Signed-off-by: Manuel Lauss <manuel.lauss@googlemail.com>
>         Cc: linux-mips@linux-mips.org
>         Patchwork: https://patchwork.linux-mips.org/patch/3007/
>         Signed-off-by: Ralf Baechle <ralf@linux-mips.org>

The alchemy PCI controller is a platform_device, and it must be
initialized before enumerating the PCI devices below it.  The same
order should apply for suspend/resume (suspend PCI devices, then PCI
controller; resume PCI controller, then PCI devices).

So if this didn't work before, I think it means something is messed up
with the device hierarchy.

But I understand the difficulty of testing changes here, so syscore is
simplest from that point of view.

It does complicate maintenance though.  I think all of mips ultimately
uses register_pci_controller() and pcibios_scanbus().  Neither really
contains anything mips-specific, so they duplicate a lot of the code
in pci_host_probe().  Oh well, I guess that's part of the burden of
supporting old platforms forever.

Bjorn

