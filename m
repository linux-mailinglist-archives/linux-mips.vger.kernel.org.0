Return-Path: <linux-mips+bounces-13441-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IHogMUzVr2kfcgIAu9opvQ
	(envelope-from <linux-mips+bounces-13441-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Tue, 10 Mar 2026 09:24:44 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 1762924742D
	for <lists+linux-mips@lfdr.de>; Tue, 10 Mar 2026 09:24:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6BCD53049527
	for <lists+linux-mips@lfdr.de>; Tue, 10 Mar 2026 08:24:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74E683EF0B7;
	Tue, 10 Mar 2026 08:24:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MDZ3AMGN"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42FBC3EF0B0;
	Tue, 10 Mar 2026 08:24:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773131051; cv=none; b=bOSuGCxERRXHMfjLfWGwKNFRn8s/haYtNNzc12cOxZjKCvvD1CnX17tT+idJ8YwUjnTu8qcqifxIFuGE1Vp1DpmMqWYm4GzPy4aQT7L1U+nnOK3fAUAAhXcUSFo50q9kBolR3bMd2D9Fl1qNQjwhV73LZgNrp2yG1cTFi0jGWtc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773131051; c=relaxed/simple;
	bh=X93Yxq3bUx636kMPKo1AS2iratZcYw/WWrjo9W6vW9c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OKXjUA8RgsniYmvalpfcorvpwAokxAVkoM3Vysm42IPiSSoHqFh/uPJfYh2931z2mXsgo585Dav9G/xs0qmyIZIP9qYM4d2QZZKl/hGkxCqT2N74bTbWEpijUB8YIcUV3Hmp9Dpt0jclmorBUpL6d5azJYyQZobFZ9ALzsABY5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MDZ3AMGN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45449C19423;
	Tue, 10 Mar 2026 08:24:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773131050;
	bh=X93Yxq3bUx636kMPKo1AS2iratZcYw/WWrjo9W6vW9c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MDZ3AMGNrWWJr5OO/Vv7W7DPwZ840Y/Cw7CurnzVxWroksyoh8Dqe9AaGC4rCwprR
	 NqqY9Axsh71dzpfh/4oGqBvaF+Mn7OjU63cNLDMV2IiIlSl9ByjqLa+7gyOb/wv5nZ
	 iacizi1sBrvWpHv/TDBzI0FP41KgS5/iGVGJ325LoczzcdDF4PTj0OUmmlD60bnk/S
	 QA1dgecDr2zleSU8epPC5M0Hwy1fWWF7EDqo+stAapt5cBUdhxcbJVfsOEBDUJH3I1
	 EMkDhDZBZQv1AXbKrsoGqoxmueiwb3LLHV+6ScLghnJM43vV5vKNlOV9ZyElByVpmF
	 eUdQ3lYXxYQTg==
Date: Tue, 10 Mar 2026 09:24:08 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Caleb James DeLisle <cjd@cjdns.fr>
Cc: linux-mips@vger.kernel.org, naseefkm@gmail.com, 
	mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, tsbogend@alpha.franken.de, ryder.lee@mediatek.com, 
	jianjun.wang@mediatek.com, lpieralisi@kernel.org, kwilczynski@kernel.org, mani@kernel.org, 
	bhelgaas@google.com, vkoul@kernel.org, neil.armstrong@linaro.org, 
	p.zabel@pengutronix.de, matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com, 
	nbd@nbd.name, ansuelsmth@gmail.com, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-phy@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 3/8] dt-bindings: phy: Document PCIe PHY in EcoNet
 EN751221 and EN7528
Message-ID: <20260310-scrupulous-fat-ara-eab47c@quoll>
References: <20260309131818.74467-1-cjd@cjdns.fr>
 <20260309131818.74467-4-cjd@cjdns.fr>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260309131818.74467-4-cjd@cjdns.fr>
X-Rspamd-Queue-Id: 1762924742D
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-13441-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[29];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,baylibre.com,kernel.org,alpha.franken.de,mediatek.com,google.com,linaro.org,pengutronix.de,collabora.com,nbd.name,lists.infradead.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-mips@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-mips,dt];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,cjdns.fr:email]
X-Rspamd-Action: no action

On Mon, Mar 09, 2026 at 01:18:13PM +0000, Caleb James DeLisle wrote:
> EN751221 and EN7528 SoCs have two PCIe slots, and each one has a PHY
> which behaves slightly differently because one slot is Gen1/Gen2 while
> the other is Gen1 only.
> 
> Signed-off-by: Caleb James DeLisle <cjd@cjdns.fr>

Still, four separate subsystems unnecessarily merged into one patchset.
Split independent parts of your work per subsystem. See also submitting
patches.

> ---
>  .../phy/econet,en751221-pcie-phy.yaml         | 50 +++++++++++++++++++
>  MAINTAINERS                                   |  6 +++
>  2 files changed, 56 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/phy/econet,en751221-pcie-phy.yaml

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


