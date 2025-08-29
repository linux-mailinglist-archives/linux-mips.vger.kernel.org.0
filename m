Return-Path: <linux-mips+bounces-10808-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BF0F6B3B8C7
	for <lists+linux-mips@lfdr.de>; Fri, 29 Aug 2025 12:31:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 65719A0407F
	for <lists+linux-mips@lfdr.de>; Fri, 29 Aug 2025 10:31:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 148BD30BF77;
	Fri, 29 Aug 2025 10:31:25 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE2FE3093CB;
	Fri, 29 Aug 2025 10:31:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756463484; cv=none; b=kQOiU4TcYm3N4PFZI+ix6HjWeXI6OElFkH8/U5Egfdkcy9GUI28gaMvkyEWbka0aws71Yca4zaE/dvvXDsVEEZbkMDUfX8zvksuqLqUMGJryfzfT8yApUI32nux+6pXOLeihQnqG/A9yRWtpaQm3SZWc/K2zOTOREcbdzGMyGfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756463484; c=relaxed/simple;
	bh=scZcinbTzN8o8Y+jCWTGEqcBsO2Nuy7SNS2QbPiMiXo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eQaR9+ZFMqs7mm1pcriVPL6RiF7eoNrrjCSJMgTSpLRZVT7ooP8cllv+as14H6nyRHC/n+O5div0eMYzzVVmRCn4fgaYOtiCXihBCipJ4l92ZdOo0OGYUZ1jd7JKWiw5XE4tT2nH9Zx9KagkivXJb4/edxvCh6Efe45jl3I80g4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1urwO1-0004FO-00; Fri, 29 Aug 2025 12:31:13 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
	id E19A6C0796; Fri, 29 Aug 2025 12:21:00 +0200 (CEST)
Date: Fri, 29 Aug 2025 12:21:00 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: linux-mips@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
	Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	"open list:MEMORY CONTROLLER DRIVERS" <linux-kernel@vger.kernel.org>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	"moderated list:BROADCOM BCM7XXX ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH 0/2] brcmstb-memc-ddr binding updates for MIPS boards
Message-ID: <aLF_DEu6YNSCSRxu@alpha.franken.de>
References: <20250729205213.3392481-1-florian.fainelli@broadcom.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250729205213.3392481-1-florian.fainelli@broadcom.com>

On Tue, Jul 29, 2025 at 01:52:11PM -0700, Florian Fainelli wrote:
> This patch series updates the MIPS-based Broadcom STB chips to use a
> proper compatible string for their memory controller node(s) after
> 501be7cecec9 ("dt-bindings: memory-controller: Define fallback
> compatible").
> 
> Florian Fainelli (2):
>   dt-bindings: memory: Update brcmstb-memc-ddr binding with older chips
>   MIPS: BMIPS: Properly define memory controller compatible
> 
>  .../bindings/memory-controllers/brcm,brcmstb-memc-ddr.yaml  | 4 ++++
>  arch/mips/boot/dts/brcm/bcm7346.dtsi                        | 3 ++-
>  arch/mips/boot/dts/brcm/bcm7360.dtsi                        | 3 ++-
>  arch/mips/boot/dts/brcm/bcm7362.dtsi                        | 3 ++-
>  arch/mips/boot/dts/brcm/bcm7425.dtsi                        | 6 ++++--
>  arch/mips/boot/dts/brcm/bcm7435.dtsi                        | 6 ++++--
>  6 files changed, 18 insertions(+), 7 deletions(-)

series applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

