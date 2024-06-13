Return-Path: <linux-mips+bounces-3666-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B6175907BD0
	for <lists+linux-mips@lfdr.de>; Thu, 13 Jun 2024 20:56:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3CA14282C8A
	for <lists+linux-mips@lfdr.de>; Thu, 13 Jun 2024 18:56:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6918114B94F;
	Thu, 13 Jun 2024 18:56:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HEpBy4AW"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C08D84A48;
	Thu, 13 Jun 2024 18:56:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718305005; cv=none; b=j84zK5OWYNbC3roLALFf24bma8pFI/ylz8uC2pRN+eFh0aPZCGy4qkyoRFkpAmnrs+k08mJHN2lSGbr5dK8e6M5qSaS9wE8xIQR9LaXRlirFB2meaqIXj4mj3KqQWTbqyxrHOp/09DiqNZsaHaVgadLeU5FGDQEa/7sZi1t/XIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718305005; c=relaxed/simple;
	bh=uXZ6E3qLulF11MXklHIIJ7cF2VnS2wrgifX9PKqnW/k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=COSDACE9bJZsv6yVSa2JxFOAUlYkE1M1WB4wRgsngl7uoMQRAPa9uCucKraAbSTYtj2l5L11j2kBTtMr6qDRsjACtW9Zer2OBWuqqqX9Fqs1OLqj25Tt/j/tcaMoGeVwU+AYC+yzpD9U2NXeep+Elkq1CjWifcrGe6V6EzoUUug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HEpBy4AW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89072C2BBFC;
	Thu, 13 Jun 2024 18:56:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718305004;
	bh=uXZ6E3qLulF11MXklHIIJ7cF2VnS2wrgifX9PKqnW/k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HEpBy4AWf00yasdrAG8ob50nhRdDj6UEr+ZcraYk6G0ghQc92pMgtg+7vHy/8xAgz
	 Izcz5SHhOYQCAE47ut3D+8wRx6Ub1jicZMwheORS6rPOUXpvC+AnuJxjFZFPawvMqv
	 Au05q4mikZ4hiTvP0A6LxOgp1CQ/sbG6Ri5Nrst7HSvDp8sJchiwUSiXosYJPYjdm8
	 qlZp9xWTJTEmkfHqxL9Vhrp/Ht9ATdzfruB00OKrd5FZKHnHBNZLjoBg4AELEHK4lL
	 iSJA5hDEuAFAOboQdXo8+lodEBNABg2uwQ1qbtCkKLT+tvC37agekMfM70NfD4GKfu
	 TABcWm6HCf/gg==
Date: Thu, 13 Jun 2024 12:56:43 -0600
From: Rob Herring <robh@kernel.org>
To: Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc: Lee Jones <lee@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Burton <paulburton@kernel.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org
Subject: Re: [PATCH v2 8/8] dt-bindings: mips: img: Add devices binding
Message-ID: <20240613185643.GA2286020-robh@kernel.org>
References: <20240612-boston-syscon-v2-0-9f8e1a07fa63@flygoat.com>
 <20240612-boston-syscon-v2-8-9f8e1a07fa63@flygoat.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240612-boston-syscon-v2-8-9f8e1a07fa63@flygoat.com>

On Wed, Jun 12, 2024 at 12:56:27PM +0100, Jiaxun Yang wrote:
> Add devices binding for various Imagination Technologies
> MIPS based Platforms.
> 
> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> ---
>  .../devicetree/bindings/mips/img/devices.yaml      | 33 ++++++++++++++++++++++
>  1 file changed, 33 insertions(+)

Please drop the old bindings or at least the portion covered by 
this. That's 
Documentation/devicetree/bindings/mips/img/pistachio-marduk.txt, 
pistachio.txt, and xilfpga.txt. 

Some of the description can go in here. CPU nodes are documented 
elsewhere by schemas already and can be dropped. The boot protocol isn't 
really DT bindings, so that belongs elsewhere if you want to keep it. 
Documentation/arch/mips/ perhaps?

Rob

