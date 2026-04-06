Return-Path: <linux-mips+bounces-14071-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wJhdHJuo02k4kAcAu9opvQ
	(envelope-from <linux-mips+bounces-14071-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Mon, 06 Apr 2026 14:35:39 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 78D573A3521
	for <lists+linux-mips@lfdr.de>; Mon, 06 Apr 2026 14:35:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 136F330072A1
	for <lists+linux-mips@lfdr.de>; Mon,  6 Apr 2026 12:35:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1811733B6D3;
	Mon,  6 Apr 2026 12:35:10 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 024353368BA;
	Mon,  6 Apr 2026 12:35:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775478910; cv=none; b=S7RveF25mjPIzNDxUfj6WGdB9DrnSKP0mRKQHHtZNwmiWoZkbDX6UvpJEp9Z8AvxMbgpzN4S4PxdmRNlyVexQhG+DqdAnKWjmSxN2QuFwSu+uvhpGKr5wyxF2L55Kqew2H80mh6WqgVhUiFhILrr8FcLqAyJQosXDWrVJNRr/bU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775478910; c=relaxed/simple;
	bh=NPrPqiCgKJF1cunXDwSkfsikoy1YG9Oo6bjJxlTMuxw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kKV4vgAqaoYzH77XR9HQUkKE4J528Nrq7jQ8iWX1dCgEYlWOJ35sbXuoSYlyboXq5c7OhieEZ7qKEAeTOfswO42k1UL5m4bmD41C9qVZIgHxT92BeJX+t0LQsQ/vjpzlaJUUl86UQtLYs7OH/67GbTTKWHbKYFRjcJi8VgIc0So=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1w9jAQ-00040r-00; Mon, 06 Apr 2026 14:34:58 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
	id D45FBC0988; Mon,  6 Apr 2026 14:31:29 +0200 (CEST)
Date: Mon, 6 Apr 2026 14:31:29 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: =?iso-8859-1?Q?Th=E9o?= Lebrun <theo.lebrun@bootlin.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-mips@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>,
	Gregory CLEMENT <gregory.clement@bootlin.com>,
	=?iso-8859-1?Q?Beno=EEt?= Monin <benoit.monin@bootlin.com>,
	Tawfik Bayouk <tawfik.bayouk@mobileye.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH v7 0/3] Add MACB/GEM instances on EyeQ5, and their PHYs
Message-ID: <adOnoepPSI4QRKWI@alpha.franken.de>
References: <20260225-macb-phy-v7-0-d3c9842ec931@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260225-macb-phy-v7-0-d3c9842ec931@bootlin.com>
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	TAGGED_FROM(0.00)[bounces-14071-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[franken.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tsbogend@alpha.franken.de,linux-mips@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.294];
	MID_RHS_MATCH_FROM(0.00)[];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,alpha.franken.de:mid,linux.dev:url]
X-Rspamd-Queue-Id: 78D573A3521
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Feb 25, 2026 at 05:55:21PM +0100, Théo Lebrun wrote:
> EyeQ5 SoCs integrate two GEM instances. A system-controller register
> region named "OLB" has some control over the Ethernet PHY integration.
> 
> Extend the current OLB ecosystem with a new generic PHY driver.
>  - OLB is carried by one main platform driver: clk-eyeq.
>  - It instantiates auxiliary devices: reset-eyeq & pinctrl-eyeq5.
>  - We add a new one: phy-eyeq5-eth.
> 
> Here we update dt-bindings to indicate OLB is a PHY provider. Then we
> add MACB/GEM instances in the devicetree, and the PHYs on the eval
> board.
> 
> About related patches:
> 
>  - PHY patches are incoming to add the driver. Patches used to be [2] in
>    the same series.
> 
>  - clk patches are incoming to make clk-eyeq instantiate this new
>    auxiliary device. They also ensure we get a dev->of_node assigned.
>    Patches used to be [2] in the same series.
> 
> Have a nice day,
> Thanks!
> Théo
> 
> [0]: https://lore.kernel.org/lkml/20250627-macb-v2-15-ff8207d0bb77@bootlin.com/
> [1]: https://lore.kernel.org/lkml/20251022-macb-eyeq5-v2-0-7c140abb0581@bootlin.com/
> 
> Signed-off-by: Théo Lebrun <theo.lebrun@bootlin.com>
> ---
> Changes in v7:
> - Separate PHY / clk / MIPS patches into three series.
> - Rebase onto v7.0-rc1 and test on EyeQ5. Nothing to report.
> - Link to v6: https://lore.kernel.org/r/20260127-macb-phy-v6-0-cdd840588188@bootlin.com
> 
> Changes in v6:
> - Rebase upon v6.19-rc7; nothing to report.
> - Add new patch "phy: sort Kconfig and Makefile".
> - phy-eyeq5-eth: drop useless explicit __iomem cast to
>   dev_get_platdata() return value.
> - I did *not* drop the Kconfig `default MACH_EYEQ5` nor driver
>   `dev_dbg()`. I think both are useful and should be kept. See
>   last revision discussion here:
>   https://lore.kernel.org/lkml/DFGSMN8268O0.33TYCQDBVHUHZ@bootlin.com/
> - Link to v5: https://lore.kernel.org/r/20251215-macb-phy-v5-0-a9dfea39da34@bootlin.com
> 
> Changes in v5:
> - phy-eyeq5-eth:
>   - fix #includes: add delay, gfp_types, module and drop array_size,
>     bug, cleanup, container_of, lockdep, mutex.
>   - eq5_phy_xlate(): avoid magic value, use EQ5_PHY_COUNT.
>   - use dev_err_probe() in error cases of devm_phy_create() and
>     devm_of_phy_provider_register().
> - 3x Reviewed-by: Luca Ceresoli.
> - Add Neil Armstrong to Cc as new PHY subsystem reviewer.
> - Rebase on v6.19-rc1, tested on hardware, no changes.
> - Link to v4: https://lore.kernel.org/r/20251124-macb-phy-v4-0-955c625a81a7@bootlin.com
> 
> Changes in v4:
> - Append my SoB to Jerome's patch:
>   [PATCH v4 3/7] clk: eyeq: use the auxiliary device creation helper
> - Rebase on net-next & linux-{clk,mips,phy}. Nothing to report.
> - Link to v3: https://lore.kernel.org/r/20251119-macb-phy-v3-0-e9a7be186a33@bootlin.com
> 
> Changes in v3:
> - Take Philipp Zabel's Reviewed-by & Acked-by trailers on reset patch.
> - Take Thomas Bogendoerfer's two Acked-by trailers on DT patches.
> - Rebase on net-next & test on target. Nothing to report.
> - Link to v2: https://lore.kernel.org/r/20251101-macb-phy-v2-0-c1519eef16d3@bootlin.com
> 
> Changes in v2:
> - Take Acked-by: Conor Dooley on dt-bindings-patch.
> - s/%ld/%tu/ for printing ptrdiff_t; warnings on 32-bit archs.
>   Reported by NIPA's netdev/build_32bit test.
>   https://patchwork.kernel.org/project/netdevbpf/patch/20251021-macb-eyeq5-v1-7-3b0b5a9d2f85@bootlin.com/
>   https://netdev.bots.linux.dev/static/nipa/1014126/14277857/build_32bit/stderr
> - Link to v1: https://lore.kernel.org/r/20251022-macb-phy-v1-0-f29f28fae721@bootlin.com
> 
> Changes since MACB V1:
> - Drop the old "mobileye,olb" properties from DT patches; found while
>   running dtbs_check and dt_binding_check.
> - Drop all patches targeting net-next. That is MACB dt-bindings patch
>   and MACB driver code. See there here [1].
> - Link to v1: https://lore.kernel.org/lkml/20251021-macb-eyeq5-v1-0-3b0b5a9d2f85@bootlin.com/
> 
> Past versions of MACB patches:
>  - March 2025: [PATCH net-next 00/13] Support the Cadence MACB/GEM
>    instances on Mobileye EyeQ5 SoCs
>    https://lore.kernel.org/lkml/20250321-macb-v1-0-537b7e37971d@bootlin.com/
>  - June 2025: [PATCH net-next v2 00/18] Support the Cadence MACB/GEM
>    instances on Mobileye EyeQ5 SoCs
>    https://lore.kernel.org/lkml/20250627-macb-v2-0-ff8207d0bb77@bootlin.com/
>  - August 2025: [PATCH net v3 00/16] net: macb: various fixes & cleanup
>    https://lore.kernel.org/lkml/20250808-macb-fixes-v3-0-08f1fcb5179f@bootlin.com/
> 
> ---
> Théo Lebrun (3):
>       dt-bindings: soc: mobileye: OLB is an Ethernet PHY provider on EyeQ5
>       MIPS: mobileye: eyeq5: add two Cadence GEM Ethernet controllers
>       MIPS: mobileye: eyeq5-epm: add two Cadence GEM Ethernet PHYs
> 
>  .../bindings/soc/mobileye/mobileye,eyeq5-olb.yaml  |  7 +++-
>  arch/mips/boot/dts/mobileye/eyeq5-epm5.dts         | 26 +++++++++++++
>  arch/mips/boot/dts/mobileye/eyeq5.dtsi             | 45 ++++++++++++++++++++++
>  3 files changed, 77 insertions(+), 1 deletion(-)
> ---
> base-commit: 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f
> change-id: 20251022-macb-phy-21bc4e1dfbb7

seried applied to mips-next

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

