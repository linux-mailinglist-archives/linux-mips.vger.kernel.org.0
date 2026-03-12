Return-Path: <linux-mips+bounces-13595-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sEMRI2gGs2njRgAAu9opvQ
	(envelope-from <linux-mips+bounces-13595-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Thu, 12 Mar 2026 19:31:04 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C6D5727728C
	for <lists+linux-mips@lfdr.de>; Thu, 12 Mar 2026 19:31:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 89999304A6DF
	for <lists+linux-mips@lfdr.de>; Thu, 12 Mar 2026 18:31:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0299A3F1642;
	Thu, 12 Mar 2026 18:31:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jHBxBoKY"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D14DD1C8634;
	Thu, 12 Mar 2026 18:31:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773340261; cv=none; b=n00qQ/GyzRbWTkDxo7xfoEERRHEnjdIt4rAWWqP8KLZ5wC++ild9sC5FbzEMclPG0ocatq4r6kN/ubz27zpl+Ax101Aw2VLsDJOCZem/Na/LH9vY+N376ocFXd4n6sQMzQTs0CIm6KX47s8MuXVlHT86oDX35o0ZIAxok79BcV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773340261; c=relaxed/simple;
	bh=PqviWeqBkV89c2EnIpZbKL1eDclZ3wMLXwzqVGaqFZ0=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=rsDTxGBqBg/8tT2cZb+RdNzIbjEXZFewA8p1PPg6CWYn9515dVg90xKwIxslPotMcTUPD0aJxjK9GNBNoViSxp/IE9l7PzXApuLXeGr+UO9v3P7ZqzaTwmwUEYfgAqM6xa/e5URW71WR/tPJcPrOBTfdu9ZZXzS4bIsxyu+CBmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jHBxBoKY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12C81C116C6;
	Thu, 12 Mar 2026 18:31:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773340261;
	bh=PqviWeqBkV89c2EnIpZbKL1eDclZ3wMLXwzqVGaqFZ0=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=jHBxBoKY5+vOt2hEzIWlSjiH3mlSZWjGaY5rMOBL6UWlK4uXXdrxC1/5HFVl8ie08
	 ea4VGIcydBwZrp2Gkpvx7dd+mo4PFgdgw0UR56+/Nq9q5WTkOmufB23fLnX1qZbuwD
	 WoWYoYPQ2J/U9+rpNZt3w1x6ZRtZ7ZbFr0YkVlp4+iA7bC7cOT1TXSepWcjFl2F1Ca
	 711+UyvKAWZw18bUPcUEq19kKaVxBRXJtOfptKGCT2CK0fL4KEj9yVKGKnaSvWmGv/
	 m2Kp2gzUym6Qb5zOSL7bKkZB7D7c55ZQg+J5ZIEkBVMkUrjo9fEC8h1T9k5+D+HY8f
	 OvEXztfeNaQpQ==
Date: Thu, 12 Mar 2026 13:31:00 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: mani@kernel.org, linux-mediatek@lists.infradead.org, 
 kwilczynski@kernel.org, krzk+dt@kernel.org, matthias.bgg@gmail.com, 
 naseefkm@gmail.com, lpieralisi@kernel.org, bhelgaas@google.com, 
 conor+dt@kernel.org, ryder.lee@mediatek.com, linux-kernel@vger.kernel.org, 
 angelogioacchino.delregno@collabora.com, devicetree@vger.kernel.org, 
 linux-pci@vger.kernel.org, ansuelsmth@gmail.com, linux-mips@vger.kernel.org
To: Caleb James DeLisle <cjd@cjdns.fr>
In-Reply-To: <20260312165332.569772-2-cjd@cjdns.fr>
References: <20260312165332.569772-1-cjd@cjdns.fr>
 <20260312165332.569772-2-cjd@cjdns.fr>
Message-Id: <177334026016.3889069.9474337544951486443.robh@kernel.org>
Subject: Re: [PATCH 1/3] dt-bindings: PCI: mediatek: Add support for EcoNet
 EN7528
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,lists.infradead.org,gmail.com,google.com,mediatek.com,vger.kernel.org,collabora.com];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13595-lists,linux-mips=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-mips@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-mips,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: C6D5727728C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Thu, 12 Mar 2026 16:53:30 +0000, Caleb James DeLisle wrote:
> Introduce EcoNet EN7528 SoC compatible in MediaTek PCIe controller
> binding.
> 
> EcoNet PCIe controller has the same configuration model as
> Mediatek v2 but is initiallized more similarly to an MT7621
> PCIe.
> 
> Signed-off-by: Caleb James DeLisle <cjd@cjdns.fr>
> ---
>  .../bindings/pci/mediatek-pcie.yaml           | 81 +++++++++++++++++++
>  1 file changed, 81 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pci/mediatek-pcie.example.dtb: pcie@0,0: 'device_type' is a required property
	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20260312165332.569772-2-cjd@cjdns.fr

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


