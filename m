Return-Path: <linux-mips+bounces-7066-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C2529F4EF5
	for <lists+linux-mips@lfdr.de>; Tue, 17 Dec 2024 16:11:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 077CD18959BE
	for <lists+linux-mips@lfdr.de>; Tue, 17 Dec 2024 15:07:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8FE761F6694;
	Tue, 17 Dec 2024 15:07:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EexzruE2"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 615581F63CB;
	Tue, 17 Dec 2024 15:07:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734448040; cv=none; b=dZFnvJUCzfL9O7BYBSHfn982+acZftqLlMf5g5ZSoah+7tf5DJy/WhoW+loBN/RV8wHvw8ksWTjdSSKSp9jOXKX5kw6/+8H454a4XWqmZ2OpbLmXdPoZn29gJe3E2LKmjFspzXXaRhlY4+BpW/+84auViqXbkaov63uAZrLK9MY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734448040; c=relaxed/simple;
	bh=Hz3ye4coDqRTpB8Uu+VIt1fkEWgx9lC6LwJZrI9OE3o=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Ukmn/6Pa0s3SjBKq3WfFOplIcn/x2Zzfy3dLhi1+x1jnB95c+OPSCfC4ClwYev8AqP5z31UDdfoTCfxAvR3ITvIeafs4w1uffAZChezpiVmucmXuRJRbQTdqYorvuYVarlAPkZ4b/G7/SeZZg9m99+0zYRpyGSN5UoJTlenljBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EexzruE2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 942D8C4CED3;
	Tue, 17 Dec 2024 15:07:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734448039;
	bh=Hz3ye4coDqRTpB8Uu+VIt1fkEWgx9lC6LwJZrI9OE3o=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=EexzruE2u7MJWe1l5AjXspLpC14r/qs0XTd5TPQ/H3wwVaVrRhI/zywN4/9gGU5rd
	 S0U/IfQfkFh071o+itXsogOXLN1442xU4eTCSGOC+kPdlWQNXyQQxQ1VOFQNLIgPRl
	 7l9xq5Bz1EOY8CUG2r/WTRL36j/w9yoTUMGjtg9UNGCrhjWJSeVYCNkGxZb9h4ybT1
	 1e5soofNa80tNo0loLi9Uua6SAcTg+oV60mSl54AGIQhV1qNxGTAuliOi4Vc9D0dUI
	 /2Pdyc9z8YwJliQPavAM58NiJwaEjQXme5lew3Lq2eqX9dXsEA/OqqD6SbBsCSHySR
	 1GewIxSYqjx4g==
From: Lee Jones <lee@kernel.org>
To: lee@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
 conor+dt@kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net, 
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, 
 tsbogend@alpha.franken.de, hkallweit1@gmail.com, linux@armlinux.org.uk, 
 markus.stockhausen@gmx.de, 
 Chris Packham <chris.packham@alliedtelesis.co.nz>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 netdev@vger.kernel.org, linux-mips@vger.kernel.org
In-Reply-To: <20241216031346.2626805-3-chris.packham@alliedtelesis.co.nz>
References: <20241216031346.2626805-1-chris.packham@alliedtelesis.co.nz>
 <20241216031346.2626805-3-chris.packham@alliedtelesis.co.nz>
Subject: Re: (subset) [PATCH v2 2/4] dt-bindings: mfd: Add MDIO interface
 to rtl9301-switch
Message-Id: <173444803631.1901572.15614847167551978147.b4-ty@kernel.org>
Date: Tue, 17 Dec 2024 15:07:16 +0000
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.13.0

On Mon, 16 Dec 2024 16:13:44 +1300, Chris Packham wrote:
> The MDIO controller is part of the switch on the RTL9300 family of
> devices. Add a $ref to the mfd binding for these devices.
> 
> 

Applied, thanks!

[2/4] dt-bindings: mfd: Add MDIO interface to rtl9301-switch
      commit: 1061081cbe930f97ad54e820ad1996f55d93c57f

--
Lee Jones [李琼斯]


