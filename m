Return-Path: <linux-mips+bounces-14034-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KGAKDnJG0Wn5HAcAu9opvQ
	(envelope-from <linux-mips+bounces-14034-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Sat, 04 Apr 2026 19:12:18 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 244ED39BE7B
	for <lists+linux-mips@lfdr.de>; Sat, 04 Apr 2026 19:12:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id E6E003004052
	for <lists+linux-mips@lfdr.de>; Sat,  4 Apr 2026 17:12:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8F683168EB;
	Sat,  4 Apr 2026 17:12:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l24Zqoay"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6767145348
	for <linux-mips@vger.kernel.org>; Sat,  4 Apr 2026 17:12:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775322732; cv=none; b=og+NSDm9H4xOney1WXcVVlFkB3+EVAvEobndAb1++jWS3xVVcT0kd87KhWPi0J5GUi0E76QARn5S/23DU72KZqoOUTSEE9aysEEyKW4bwvC8s9pje+NaDyWijqoKES2IUPsAnuDO+qx/lEYL2QTQeNtYWx4K+kZBumxX1coc18g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775322732; c=relaxed/simple;
	bh=6HWbdXTvY5ARCKQw/mJejk6jJkYYvhLGzuFZu/CMKrk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iZ4SZe5/TvP6jTGDpITa1VW05L3v3xF8taazeJ7pK/AEC1oKvqE4aJmlUGTwfEQbAf2imfaf9GqDFugYwYwPizPbtiMvz9N3jp0Wr9d2MixXcW2H16Mb5kJqLL+MUwbbsuLligjPl+0Hc3B69clFcG2CgFDP/+yRqojrLt1DmL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l24Zqoay; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56E37C2BCB1
	for <linux-mips@vger.kernel.org>; Sat,  4 Apr 2026 17:12:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775322732;
	bh=6HWbdXTvY5ARCKQw/mJejk6jJkYYvhLGzuFZu/CMKrk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=l24ZqoayMC0xXGNQJsL1cczZw+VJ7tydZVENUQoFBihS5d0jJ67r8PkLWJbt7LO9X
	 nNEDpcOuw7tthiYq0W7ZllEXSxo1P0nmWkteU2AW/A7FTMB1eKiec9rAGl/eCan8xY
	 cuG+x8njyYuOQVmOLYoW96ZXXvFkJbdIJ3bSrizrTqBsUnV5NqWT9CmoPEJSZT/A6T
	 r5TzM/5f+0qceH5JHMLsipBwEFTxPAxgKYIZJkysfbQQD4BlPelJVwSHHuqi7q9ITh
	 PB7cR/Biqc2lujS5dbZrpsEBHzOGjFI+k/3wAx1GIyCMqHCsgfCso8EOVfFUYrU5xg
	 hCnONTBJ0i0Nw==
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-409de4132b5so1822801fac.1
        for <linux-mips@vger.kernel.org>; Sat, 04 Apr 2026 10:12:12 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXVgUp84TpoRUQcEmGpi7f+jZuYm5u3Pq2tcje/9pSvZqXP1077SECdIAvED9eNoeZXvsM3uJJHsRyw@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2hg7rZ+Zp3uCm8UQV4ae5OOpFZbnxlPNu3Cbhl0pBOwjQyVhC
	8ry5S5XQ3TQT5IdhUhuZK2qfrQd6uPr29rgBlE/A6E41biqj/iT1NuduXOanv/XgN7JytcNCbbC
	8/wz7msmP+soRV2+/zQJbnxeNJAmOWQc=
X-Received: by 2002:a05:6871:581e:b0:422:cd76:929d with SMTP id
 586e51a60fabf-4230fd2d9e4mr3996409fac.18.1775322730928; Sat, 04 Apr 2026
 10:12:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260404000644.522677-1-dianders@chromium.org>
In-Reply-To: <20260404000644.522677-1-dianders@chromium.org>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Sat, 4 Apr 2026 19:11:59 +0200
X-Gmail-Original-Message-ID: <CAJZ5v0hRKyPesMGKGoDZEMDCX-GVw6Z-dxMLhNhwy6Kjz=7MCQ@mail.gmail.com>
X-Gm-Features: AQROBzCS1sK1yep87rT-2xolltVfQ4j4qlt-9lHai0wQJnu4V3tzUHOX8_7jVCo
Message-ID: <CAJZ5v0hRKyPesMGKGoDZEMDCX-GVw6Z-dxMLhNhwy6Kjz=7MCQ@mail.gmail.com>
Subject: Re: [PATCH v4 0/9] driver core: Fix some race conditions
To: Douglas Anderson <dianders@chromium.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J . Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Alan Stern <stern@rowland.harvard.edu>, 
	Saravana Kannan <saravanak@kernel.org>, Christoph Hellwig <hch@lst.de>, Eric Dumazet <edumazet@google.com>, 
	Johan Hovold <johan@kernel.org>, Leon Romanovsky <leon@kernel.org>, 
	Alexander Lobakin <aleksander.lobakin@intel.com>, Alexey Kardashevskiy <aik@ozlabs.ru>, 
	Robin Murphy <robin.murphy@arm.com>, Andrew Morton <akpm@linux-foundation.org>, Frank.Li@kernel.org, 
	Jason Gunthorpe <jgg@ziepe.ca>, alex@ghiti.fr, alexander.stein@ew.tq-group.com, 
	andre.przywara@arm.com, andrew@codeconstruct.com.au, andrew@lunn.ch, 
	andriy.shevchenko@linux.intel.com, aou@eecs.berkeley.edu, ardb@kernel.org, 
	bhelgaas@google.com, brgl@kernel.org, broonie@kernel.org, 
	catalin.marinas@arm.com, chleroy@kernel.org, davem@davemloft.net, 
	david@kernel.org, devicetree@vger.kernel.org, dmaengine@vger.kernel.org, 
	driver-core@lists.linux.dev, gbatra@linux.ibm.com, 
	gregory.clement@bootlin.com, hkallweit1@gmail.com, iommu@lists.linux.dev, 
	jirislaby@kernel.org, joel@jms.id.au, joro@8bytes.org, kees@kernel.org, 
	kevin.brodsky@arm.com, kuba@kernel.org, lenb@kernel.org, lgirdwood@gmail.com, 
	linux-acpi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-cxl@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, linux-mm@kvack.org, 
	linux-pci@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-serial@vger.kernel.org, linux-snps-arc@lists.infradead.org, 
	linux-usb@vger.kernel.org, linux@armlinux.org.uk, 
	linuxppc-dev@lists.ozlabs.org, m.szyprowski@samsung.com, maddy@linux.ibm.com, 
	mani@kernel.org, maz@kernel.org, miko.lenczewski@arm.com, mpe@ellerman.id.au, 
	netdev@vger.kernel.org, npiggin@gmail.com, osalvador@suse.de, 
	oupton@kernel.org, pabeni@redhat.com, palmer@dabbelt.com, 
	peter.ujfalusi@gmail.com, peterz@infradead.org, pjw@kernel.org, 
	robh@kernel.org, sebastian.hesselbarth@gmail.com, tglx@kernel.org, 
	tsbogend@alpha.franken.de, vgupta@kernel.org, vkoul@kernel.org, 
	will@kernel.org, willy@infradead.org, yangyicong@hisilicon.com, 
	yeoreum.yun@arm.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[linuxfoundation.org,kernel.org,rowland.harvard.edu,lst.de,google.com,intel.com,ozlabs.ru,arm.com,linux-foundation.org,ziepe.ca,ghiti.fr,ew.tq-group.com,codeconstruct.com.au,lunn.ch,linux.intel.com,eecs.berkeley.edu,davemloft.net,vger.kernel.org,lists.linux.dev,linux.ibm.com,bootlin.com,gmail.com,jms.id.au,8bytes.org,lists.infradead.org,lists.ozlabs.org,kvack.org,armlinux.org.uk,samsung.com,ellerman.id.au,suse.de,redhat.com,dabbelt.com,infradead.org,alpha.franken.de,hisilicon.com];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-14034-lists,linux-mips=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rafael@kernel.org,linux-mips@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_GT_50(0.00)[85];
	TAGGED_RCPT(0.00)[linux-mips];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 244ED39BE7B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sat, Apr 4, 2026 at 2:07=E2=80=AFAM Douglas Anderson <dianders@chromium.=
org> wrote:
>
> The main goal of this series is to fix the observed bug talked about
> in the first patch ("driver core: Don't let a device probe until it's
> ready"). That patch fixes a problem that has been observed in the real
> world and could land even if the rest of the patches are found
> unacceptable or need to be spun.
>
> That said, during patch review Danilo correctly pointed out that many
> of the bitfield accesses in "struct device" are unsafe. I added a
> bunch of patches in the series to address each one.
>
> Danilo said he's most worried about "can_match", so I put that one
> first. After that, I tried to transition bitfields to flags in reverse
> order to when the bitfield was added.
>
> Even if transitioning from bitfields to flags isn't truly needed for
> correctness, it seems silly (and wasteful of space in struct device)
> to have some in bitfields and some as flags. Thus I didn't spend time
> for each bitfield showing that it's truly needed for correctness.
>
> Transition was done semi manually. Presumably someone skilled at
> coccinelle could do a better job, but I just used sed in a heavy-
> handed manner and then reviewed/fixed the results, undoing anything my
> script got wrong. My terrible/ugly script was:
>
> var=3Dcan_match
> caps=3D"${var^^}"
> for f in $(git grep -l "[>\.]${var}[^1-9_a-zA-Z\[]"); do
>   echo $f
>   sed -i~ -e "s/\([a-zA-Z_0-9\.>()-][a-zA-Z_0-9\.>()-]*\)->${var} =3D tru=
e/set_bit(DEV_FLAG_${caps}, \&\\1->flags)/" "$f"
>   sed -i~ -e "s/\([a-zA-Z_0-9\.>()-][a-zA-Z_0-9\.>()-]*\)\.${var} =3D tru=
e/dev_set_${caps}(\&\\1)/" "$f"
>   sed -i~ -e "s/\([a-zA-Z_0-9\.>()-][a-zA-Z_0-9\.>()-]*\)->${var} =3D fal=
se/clear_bit(DEV_FLAG_${caps}, \&\\1->flags)/" "$f"
>   sed -i~ -e "s/\([a-zA-Z_0-9\.>()-][a-zA-Z_0-9\.>()-]*\)\.${var} =3D fal=
se/dev_clear_${caps}(\&\\1)/" "$f"
>   sed -i~ -e "s/\([a-zA-Z_0-9\.>()-][a-zA-Z_0-9\.>()-]*\)->${var} =3D \([=
^;]*\)/assign_bit(DEV_FLAG_${caps}, \&\\1->flags, \\2)/" "$f"
>   sed -i~ -e "s/\([a-zA-Z_0-9\.>()-][a-zA-Z_0-9\.>()-]*\)\.${var} =3D \([=
^;]*\)/dev_assign_${caps}(\&\\1, \\2)/" "$f"
>   sed -i~ -e "s/\([a-zA-Z_0-9\.>()-][a-zA-Z_0-9\.>()-]*\)->${var}\([^1-9_=
a-zA-Z\[]\)/test_bit(DEV_FLAG_${caps}, \&\\1->flags)\\2/" "$f"
>   sed -i~ -e "s/\([a-zA-Z_0-9\.>()-][a-zA-Z_0-9\.>()-]*\)\.${var}\([^1-9_=
a-zA-Z\[]\)/dev_${caps}(\&\\1)\\2/" "$f"
> done
>
> From v3 to v4, I transitioned to accessor functions with another ugly
> sed script. I had git format the old patches, then transformed them
> with:
>
> for f in *.patch; do
>   echo $f
>   sed -i~ -e "s/test_and_set_bit(DEV_FLAG_\([^,]*\), \&\(.*\)->flags)/dev=
_test_and_set_\\L\\1(\\2)/" "$f"
>   sed -i~ -e "s/test_and_set_bit(DEV_FLAG_\([^,]*\), \(.*\)\.flags)/dev_t=
est_and_set_\\L\\1(\\2)/" "$f"
>   sed -i~ -e "s/test_bit(DEV_FLAG_\([^,]*\), \&\(.*\)->flags)/dev_\\L\\1(=
\\2)/" "$f"
>   sed -i~ -e "s/test_bit(DEV_FLAG_\([^,]*\), \(.*\)\.flags)/dev_\\L\\1(\\=
2)/" "$f"
>   sed -i~ -e "s/set_bit(DEV_FLAG_\([^,]*\), \&\(.*\)->flags)/dev_set_\\L\=
\1(\\2)/" "$f"
>   sed -i~ -e "s/set_bit(DEV_FLAG_\([^,]*\), \(.*\)\.flags)/dev_set_\\L\\1=
(\\2)/" "$f"
>   sed -i~ -e "s/clear_bit(DEV_FLAG_\([^,]*\), \&\(.*\)->flags)/dev_clear_=
\\L\\1(\\2)/" "$f"
>   sed -i~ -e "s/clear_bit(DEV_FLAG_\([^,]*\), \(.*\)\.flags)/dev_clear_\\=
L\\1(\\2)/" "$f"
>   sed -i~ -e "s/assign_bit(DEV_FLAG_\([^,]*\), \&\(.*\)->flags, \(.*\))/d=
ev_assign_\\L\\1(\\2, \\3)/" "$f"
>   sed -i~ -e "s/assign_bit(DEV_FLAG_\([^,]*\), \(.*\)\.flags, \(.*\))/dev=
_assign_\\L\\1(\\2, \\3)/" "$f"
> done
>
> ...and then did a few manual touchups for spacing.
>
> NOTE: one potentially "controversial" choice I made in some patches
> was to always reserve a flag ID even if a flag is only used under
> certain CONFIG_ settings. This is a change from how things were
> before. Keeping the numbering consistent and allowing easy
> compile-testing of both CONFIG settings seemed worth it, especially
> since it won't take up any extra space until we've added a lot more
> flags.
>
> I only marked the first patch as a "Fix" since it is the only one
> fixing observed problems. Other patches could be considered fixes too
> if folks want.
>
> I tested the first patch in the series backported to kernel 6.6 on the
> Pixel phone that was experiencing the race. I added extra printouts to
> make sure that the problem was hitting / addressed. The rest of the
> patches are tested with allmodconfig with arm32, arm64, ppc, and
> x86. I boot tested on an arm64 Chromebook running mainline.
>
> Changes in v4:
> - Use accessor functions for flags
>
> Changes in v3:
> - Use a new "flags" bitfield
> - Add missing \n in probe error message
>
> Changes in v2:
> - Instead of adjusting the ordering, use "ready_to_probe" flag
>
> Douglas Anderson (9):
>   driver core: Don't let a device probe until it's ready
>   driver core: Replace dev->can_match with dev_can_match()
>   driver core: Replace dev->dma_iommu with dev_dma_iommu()
>   driver core: Replace dev->dma_skip_sync with dev_dma_skip_sync()
>   driver core: Replace dev->dma_ops_bypass with dev_dma_ops_bypass()
>   driver core: Replace dev->state_synced with dev_state_synced()
>   driver core: Replace dev->dma_coherent with dev_dma_coherent()
>   driver core: Replace dev->of_node_reused with dev_of_node_reused()
>   driver core: Replace dev->offline + ->offline_disabled with accessors
>
>  arch/arc/mm/dma.c                             |   4 +-
>  arch/arm/mach-highbank/highbank.c             |   2 +-
>  arch/arm/mach-mvebu/coherency.c               |   2 +-
>  arch/arm/mm/dma-mapping-nommu.c               |   4 +-
>  arch/arm/mm/dma-mapping.c                     |  28 ++--
>  arch/arm64/kernel/cpufeature.c                |   2 +-
>  arch/arm64/mm/dma-mapping.c                   |   2 +-
>  arch/mips/mm/dma-noncoherent.c                |   2 +-
>  arch/powerpc/kernel/dma-iommu.c               |   8 +-
>  .../platforms/pseries/hotplug-memory.c        |   4 +-
>  arch/riscv/mm/dma-noncoherent.c               |   2 +-
>  drivers/acpi/scan.c                           |   2 +-
>  drivers/base/core.c                           |  53 +++++---
>  drivers/base/cpu.c                            |   4 +-
>  drivers/base/dd.c                             |  28 ++--
>  drivers/base/memory.c                         |   2 +-
>  drivers/base/pinctrl.c                        |   2 +-
>  drivers/base/platform.c                       |   2 +-
>  drivers/dma/ti/k3-udma-glue.c                 |   6 +-
>  drivers/dma/ti/k3-udma.c                      |   6 +-
>  drivers/iommu/dma-iommu.c                     |   9 +-
>  drivers/iommu/iommu.c                         |   5 +-
>  drivers/net/pcs/pcs-xpcs-plat.c               |   2 +-
>  drivers/of/device.c                           |   6 +-
>  drivers/pci/of.c                              |   2 +-
>  drivers/pci/pwrctrl/core.c                    |   2 +-
>  drivers/regulator/bq257xx-regulator.c         |   2 +-
>  drivers/regulator/rk808-regulator.c           |   2 +-
>  drivers/tty/serial/serial_base_bus.c          |   2 +-
>  drivers/usb/gadget/udc/aspeed-vhub/dev.c      |   2 +-
>  include/linux/device.h                        | 120 ++++++++++++------
>  include/linux/dma-map-ops.h                   |   6 +-
>  include/linux/dma-mapping.h                   |   2 +-
>  include/linux/iommu-dma.h                     |   3 +-
>  kernel/cpu.c                                  |   4 +-
>  kernel/dma/mapping.c                          |  12 +-
>  mm/hmm.c                                      |   2 +-
>  37 files changed, 206 insertions(+), 142 deletions(-)
>
> --

For the whole set

Reviewed-by: Rafael J. Wysocki (Intel) <rafael@kernel.org>

