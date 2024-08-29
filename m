Return-Path: <linux-mips+bounces-5212-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id BDAB3964054
	for <lists+linux-mips@lfdr.de>; Thu, 29 Aug 2024 11:37:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 56421B256C8
	for <lists+linux-mips@lfdr.de>; Thu, 29 Aug 2024 09:37:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E47B18D620;
	Thu, 29 Aug 2024 09:37:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="cWz55Bm4"
X-Original-To: linux-mips@vger.kernel.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 699D818E76B;
	Thu, 29 Aug 2024 09:37:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724924226; cv=none; b=umy+bBlYiD54sd37mGye/xOU6jBImTMhg5ivnjEkVpSYddFEUtcp8AWJtjds851fFHmCJFeMjWqkOZ8wYfR/9kxUThf4CoJ5M0n9A66ktjRN3g9Rd/5dcLXk06PQEZJxFkibP/cEKLldQJ6jjYPCu9IQcynW86VfeUGay35jkbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724924226; c=relaxed/simple;
	bh=c8/tk7ME/v3aIAukzMKnWe7ZhTpA+2uAjbdEdQVWFuc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BtDY5f1NTHTOHZkGU9BTToTCe3tzhjjvFaP7tfv8NE1aXFCK2UIu/0NzOcjPisDzLVhFMAetWDkIkpTxl5Ie4lVAh7yz9pM3qPPldnU90aVGp/M5dolcH8+Hm/cUxogxTI9TOAcacOVC+sAW3D+KK5TcJ+yMucq2+j7FGfZUGzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=cWz55Bm4; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=OpJRCqvJUgPhUkiazewk4fbcOXCM86KxZfljMMe7Uig=; b=cWz55Bm4M9U8thKk6gSuu/A07u
	w2RVOJ013+1Kl+2mN92amgwPyNv6DoHWbFMmIxsZBP6gZ4J1uvArpAd5fypGxjzlVNfTWiTna0BCC
	cFnGoL60SdlGm94Z5GnX561yMyUMBLbfsjazgIVAEGx7lKSqwOd9hNYmXilpmnXwhlPEifqkmOjqG
	cDB/5kyeq8xDoIoGzOijhl3Qh/M6oTn1YtFqLsVAtCdW1SF4ZdqJ9EVPYIiE1xDkUMBBocuqQHAbw
	Otlg+VZvaNgdisNklffp57T4hSRYt5ksZ+v6jxy85IHGmMDfMRpI/OduwFB1Dwt7AQArmEHL7PKGe
	4kQJjWWQ==;
Received: from i5e861916.versanet.de ([94.134.25.22] helo=phil.lan)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1sjbaI-0002nq-3Y; Thu, 29 Aug 2024 11:36:54 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Elaine Zhang <zhangqing@rock-chips.com>,
	devicetree@vger.kernel.org,
	linux-mips@vger.kernel.org,
	Magnus Damm <magnus.damm@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	patches@opensource.cirrus.com,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-stm32@st-md-mailman.stormreply.com,
	Serge Semin <fancer.lancer@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	linux-kernel@vger.kernel.org,
	Gabriel Fernandez <gabriel.fernandez@foss.st.com>,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Michael Turquette <mturquette@baylibre.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	linux-rockchip@lists.infradead.org,
	Conor Dooley <conor+dt@kernel.org>
Cc: Heiko Stuebner <heiko@sntech.de>
Subject: Re: (subset) [PATCH 1/5] dt-bindings: clock: baikal,bt1-ccu-div: add top-level constraints
Date: Thu, 29 Aug 2024 11:36:49 +0200
Message-ID: <172492351369.1695089.4051009745081865137.b4-ty@sntech.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240818173014.122073-1-krzysztof.kozlowski@linaro.org>
References: <20240818173014.122073-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Sun, 18 Aug 2024 19:30:10 +0200, Krzysztof Kozlowski wrote:
> Properties with variable number of items per each device are expected to
> have widest constraints in top-level "properties:" block and further
> customized (narrowed) in "if:then:".  Add missing top-level constraints
> for clocks and clock-names.
> 
> 

Applied, thanks!

[4/5] dt-bindings: clock: rockchip,rk3588-cru: drop unneeded assigned-clocks
      commit: 3529dc29fe65672ad9aeab9499fee901d0010901

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

