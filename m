Return-Path: <linux-mips+bounces-13621-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2IUEDJtls2mVVwAAu9opvQ
	(envelope-from <linux-mips+bounces-13621-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Fri, 13 Mar 2026 02:17:15 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C5BEB27C361
	for <lists+linux-mips@lfdr.de>; Fri, 13 Mar 2026 02:17:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4F418304DF23
	for <lists+linux-mips@lfdr.de>; Fri, 13 Mar 2026 01:16:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98B86314A64;
	Fri, 13 Mar 2026 01:16:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jFllOpLR"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D0DD15665C;
	Fri, 13 Mar 2026 01:16:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773364617; cv=none; b=mjGKNmb2MlYTrwSMlQuT0wUcgpRdbMKBPcoVthHHh9oVOyLV4kGlS7o2gjiJZrw9fIiopLqq6s3j4DDo5NBlL6Xz6asevl/BR88PCbt5u0Gdo5tdZZUR1gAxLIFgaYejACZPUJRlUuayCcjk4ADKcM+8pAgzZj5BzGEC3OwvbVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773364617; c=relaxed/simple;
	bh=zPEcR98I4xhUijv+qJNI6kaevc+I8oOwAq51hsyZIN4=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GFidzKx/mkwZZ5ju5GaElScOXb1bqKf7DuumaPaTMypxa3w4Gf7rhx/pVZKkGepn1P8H2IXPlTkehmc95UsQObCJircBR9Ztwc+IzXW+zyxnsGbmxlmWNzOnEwzyjr8xbr/bv01Yp7lXhI4f4OuiD9X3ahGPV/QMkSCcdqBiCRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jFllOpLR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF82BC4CEF7;
	Fri, 13 Mar 2026 01:16:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773364617;
	bh=zPEcR98I4xhUijv+qJNI6kaevc+I8oOwAq51hsyZIN4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=jFllOpLRMRE2IGfEDXUEY9ba4b3cNJWvEbGvGBw5ZGzoCW8DWdJj0BqcNiQ/Y8GUJ
	 cRhG0Zmu/MtyrpDtIKMli5RfjyB/7DdinXkjUxwC3r2xHYzxZbVE1PbUsIBtNBGdXT
	 zBg/De8hBSG2RiGNlB9aDCTKJRuiv+r9Rg4ZJ3giPiudOiLXMS1iDeGg6PQ7NkTCtQ
	 CN1f3+8XC3U+KAwErIpoSpBRfdv6Z/+4x5hJTBdsFVOCyayhVGj6jeZHQfgm+zMlxj
	 EQv4E9b4SZXOVU2lIIor9NApwk4IbuDYgD3C03BfACceOsz9wt5jUmHqlze9bYvBTs
	 DJoY+01DWokAA==
Date: Thu, 12 Mar 2026 18:16:54 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio
 <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Andrew
 Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Maxime
 Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Vinod Koul <vkoul@kernel.org>, Giuseppe
 Cavallaro <peppe.cavallaro@st.com>, Chen-Yu Tsai <wens@kernel.org>, Jernej
 Skrabec <jernej.skrabec@gmail.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, Jerome
 Brunet <jbrunet@baylibre.com>, Shawn Guo <shawnguo@kernel.org>, Fabio
 Estevam <festevam@gmail.com>, Jan Petrous <jan.petrous@oss.nxp.com>,
 s32@nxp.com, Romain Gantois <romain.gantois@bootlin.com>, Geert
 Uytterhoeven <geert+renesas@glider.be>, Magnus Damm
 <magnus.damm@gmail.com>, Maxime Ripard <mripard@kernel.org>, Christophe
 Roullier <christophe.roullier@foss.st.com>, Bartosz Golaszewski
 <brgl@kernel.org>, Radu Rendec <rrendec@redhat.com>,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, Drew Fustini
 <dfustini@tenstorrent.com>, linux-sunxi@lists.linux.dev,
 linux-amlogic@lists.infradead.org, linux-mips@vger.kernel.org,
 imx@lists.linux.dev, linux-renesas-soc@vger.kernel.org,
 linux-rockchip@lists.infradead.org, sophgo@lists.linux.dev,
 linux-riscv@lists.infradead.org, Bartosz Golaszewski
 <bartosz.golaszewski@linaro.org>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, Krzysztof Kozlowski
 <krzysztof.kozlowski@oss.qualcomm.com>, Lad Prabhakar
 <prabhakar.mahadev-lad.rj@bp.renesas.com>, Konrad Dybcio
 <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH net-next v8 0/6] net: stmmac: qcom-ethqos: add support
 for SCMI power domains
Message-ID: <20260312181654.2d9ba69c@kernel.org>
In-Reply-To: <20260311-qcom-sa8255p-emac-v8-0-58227bcf1018@oss.qualcomm.com>
References: <20260311-qcom-sa8255p-emac-v8-0-58227bcf1018@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,lunn.ch,davemloft.net,google.com,redhat.com,gmail.com,foss.st.com,st.com,linaro.org,baylibre.com,oss.nxp.com,nxp.com,bootlin.com,glider.be,vger.kernel.org,st-md-mailman.stormreply.com,lists.infradead.org,tenstorrent.com,lists.linux.dev,googlemail.com,oss.qualcomm.com,bp.renesas.com];
	TAGGED_FROM(0.00)[bounces-13621-lists,linux-mips=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_GT_50(0.00)[50];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kuba@kernel.org,linux-mips@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-mips,dt,netdev,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: C5BEB27C361
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, 11 Mar 2026 18:03:35 +0100 Bartosz Golaszewski wrote:
> Add support for the firmware-managed variant of the DesignWare MAC on
> the sa8255p platform. This series contains new DT bindings and driver
> changes required to support the MAC in the STMMAC driver.
> 
> It also reorganizes the ethqos code quite a bit to make the introduction
> of power domains into the driver a bit easier on the eye.

Not entirely sure what the conclusion was in the sub-thread with Russell
but FWIW this doesn't apply to net-next as posted so respin will be
needed either way.

