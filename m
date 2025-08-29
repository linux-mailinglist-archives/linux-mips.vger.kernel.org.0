Return-Path: <linux-mips+bounces-10853-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 34B8DB3BF8B
	for <lists+linux-mips@lfdr.de>; Fri, 29 Aug 2025 17:40:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1F35A7BAF1A
	for <lists+linux-mips@lfdr.de>; Fri, 29 Aug 2025 15:38:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8CB7D32C32D;
	Fri, 29 Aug 2025 15:36:59 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 424F92F659F;
	Fri, 29 Aug 2025 15:36:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756481819; cv=none; b=UwJ7RsM2n+Gvi0iL8yKfCUJkyG83G506C116Q667mtcs3SHbF67h0Q+nqW9hHOnNh0R4POBSxW512RpMH3MZYPRAwloHeeQbXB+Qj5xfB+if2FW4CmCBYzPHKU52UKcV0udfts7v2tIDTR3erx7CkZcqsmLvLw2D8KyPuox9BXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756481819; c=relaxed/simple;
	bh=+TtO7jcZDX1v3bf6ZMUIYDCvJx81u0lBleSZnfGSpe8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fD+fvRQqQ4JCiX5/rqhH++Z2e4++b2VBK7t1OW0VJ6Cy8r4AoYtY15SMtllUkhqts2UhljTLJONVJ2OvFjGhLFcpYPJ+vQnJ4qyQgZZ2RbSUMIHTU0WZ3WFHMI8nbukfj1gVQiETeCUQoxKvN8CI8XWhFiPmsTU54mBWnWbAPtg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1us19p-0006bt-00; Fri, 29 Aug 2025 17:36:53 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
	id A28FAC0513; Fri, 29 Aug 2025 17:36:13 +0200 (CEST)
Date: Fri, 29 Aug 2025 17:36:13 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	linux-mips@vger.kernel.org, Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	"open list:MEMORY CONTROLLER DRIVERS" <linux-kernel@vger.kernel.org>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	"moderated list:BROADCOM BCM7XXX ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH 0/2] brcmstb-memc-ddr binding updates for MIPS boards
Message-ID: <aLHI7arPfcMDEhzM@alpha.franken.de>
References: <20250729205213.3392481-1-florian.fainelli@broadcom.com>
 <aLF_DEu6YNSCSRxu@alpha.franken.de>
 <dcb0c746-62ed-48f6-9247-03bdf36c6e92@kernel.org>
 <60e55e14-7712-4f82-93af-6751009327fd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <60e55e14-7712-4f82-93af-6751009327fd@kernel.org>

On Fri, Aug 29, 2025 at 12:39:00PM +0200, Krzysztof Kozlowski wrote:
> On 29/08/2025 12:37, Krzysztof Kozlowski wrote:
> > On 29/08/2025 12:21, Thomas Bogendoerfer wrote:
> >> On Tue, Jul 29, 2025 at 01:52:11PM -0700, Florian Fainelli wrote:
> >>> This patch series updates the MIPS-based Broadcom STB chips to use a
> >>> proper compatible string for their memory controller node(s) after
> >>> 501be7cecec9 ("dt-bindings: memory-controller: Define fallback
> >>> compatible").
> >>>
> >>> Florian Fainelli (2):
> >>>   dt-bindings: memory: Update brcmstb-memc-ddr binding with older chips
> >>>   MIPS: BMIPS: Properly define memory controller compatible
> >>>
> >>>  .../bindings/memory-controllers/brcm,brcmstb-memc-ddr.yaml  | 4 ++++
> >>>  arch/mips/boot/dts/brcm/bcm7346.dtsi                        | 3 ++-
> >>>  arch/mips/boot/dts/brcm/bcm7360.dtsi                        | 3 ++-
> >>>  arch/mips/boot/dts/brcm/bcm7362.dtsi                        | 3 ++-
> >>>  arch/mips/boot/dts/brcm/bcm7425.dtsi                        | 6 ++++--
> >>>  arch/mips/boot/dts/brcm/bcm7435.dtsi                        | 6 ++++--
> >>>  6 files changed, 18 insertions(+), 7 deletions(-)
> >>
> >> series applied to mips-next.
> > 
> > Why entire series? You were notified two weeks ago that I already took
> > the driver subsystem patch.

I haven't got a mail in this thread from you about taking the first patch.

> ...and you do not have even ack from memory-controllers for that patch.

sorry, I'll drop the patch then.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

