Return-Path: <linux-mips+bounces-14051-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OPpdOFEJ0mkrSwcAu9opvQ
	(envelope-from <linux-mips+bounces-14051-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Sun, 05 Apr 2026 09:03:45 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F26B39D898
	for <lists+linux-mips@lfdr.de>; Sun, 05 Apr 2026 09:03:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B8B8E3007F6B
	for <lists+linux-mips@lfdr.de>; Sun,  5 Apr 2026 07:03:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A987224AFA;
	Sun,  5 Apr 2026 07:03:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U4JLTX8/"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F39F70818;
	Sun,  5 Apr 2026 07:03:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775372622; cv=none; b=dtU8j07nCqZojhFcpZewGRgXd0GdBNtQ4wszIunV6avO5oV2MSIJFSWmU5sRrywKYBx9SGJTZe4YPE1XP9uxOLG+18aA2RC7p8lEljZOESVl0e25w844R4hb9sJaPF3BGmFEVpLgD9mzpYS9Bi4wX5GmvkvOp2YHNXxWb2IKE/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775372622; c=relaxed/simple;
	bh=cGZQASeUOD7DEYI24yGkpzM2VpgQdKxFA6eMQ7fZ9Mg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AG+kGlLKkBk19njCVwh41LGi9N2voc/I470uXLWan4WWVEVc1Bbzh1dDmCLu3Y8yjwsYkkqRZxIotexBGWriZ60UDBP6o50jo45dSWz+bgYyI6B975W6H70K70Kq3rgo1H5YoK+biNrAOpCXog3z/ELc6KxdRhExq7JXLelngGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U4JLTX8/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17DF8C116C6;
	Sun,  5 Apr 2026 07:03:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775372621;
	bh=cGZQASeUOD7DEYI24yGkpzM2VpgQdKxFA6eMQ7fZ9Mg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=U4JLTX8/zDK6FRLC2p7WxuOu6hFXklMMukj9ElNkbETU0DRkXJLsJQ8h+1l6XGg7o
	 BxaCe6udKIsJLA5gFXj9mFJyPrYMsLFy5M8BwiE0ocE8M/yWRBM7h1pP6yTRhvqzBb
	 xoDvZ9MWgwDEEymjkd8ILzjWo2jVI0NX/QlshiEnFNMeh5oppoP30SWH5AjOv1IAol
	 /Pv8ZKG1mXGB/btCYEdFWN+14AOkY8luPUbqGNngYgJwZu+73NZL6i1/TaCCSw2rbB
	 VP2sPwgb8JFZI+UWYsg/qDFKJ8HVtEOJqdFod70D3pqJpYFZG/PM8m1HEJO8LktkEz
	 4oasjxw6uhtSw==
Date: Sun, 5 Apr 2026 09:03:39 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Caleb James DeLisle <cjd@cjdns.fr>
Cc: linux-pci@vger.kernel.org, linux-mips@vger.kernel.org, 
	naseefkm@gmail.com, ryder.lee@mediatek.com, helgaas@kernel.org, 
	lpieralisi@kernel.org, kwilczynski@kernel.org, mani@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, matthias.bgg@gmail.com, 
	angelogioacchino.delregno@collabora.com, ansuelsmth@gmail.com, linux-mediatek@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/2] dt-bindings: PCI: mediatek: Add support for
 EcoNet EN7528
Message-ID: <20260405-phenomenal-messy-shark-bdefbd@quoll>
References: <20260404182854.2183651-1-cjd@cjdns.fr>
 <20260404182854.2183651-2-cjd@cjdns.fr>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260404182854.2183651-2-cjd@cjdns.fr>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-14051-lists,linux-mips=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,mediatek.com,kernel.org,collabora.com,lists.infradead.org];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-mips@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-mips,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 3F26B39D898
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sat, Apr 04, 2026 at 06:28:53PM +0000, Caleb James DeLisle wrote:
> Introduce EcoNet EN7528 SoC compatible in MediaTek PCIe controller
> binding.
> 
> EcoNet PCIe controller has the same configuration model as
> Mediatek v2 but is initialized more similarly to an MT7621
> PCIe.
> 

<form letter>
This is a friendly reminder during the review process.

It looks like you received a tag and forgot to add it.

If you do not know the process, here is a short explanation:
Please add Acked-by/Reviewed-by/Tested-by tags when posting new
versions of patchset, under or above your Signed-off-by tag, unless
patch changed significantly (e.g. new properties added to the DT
bindings). Tag is "received", when provided in a message replied to you
on the mailing list. Tools like b4 can help here. However, there's no
need to repost patches *only* to add the tags. The upstream maintainer
will do that for tags received on the version they apply.

Please read:
https://elixir.bootlin.com/linux/v6.12-rc3/source/Documentation/process/submitting-patches.rst#L577

If a tag was not added on purpose, please state in the patch changelog
or cover letter why and what changed.
</form letter>

Best regards,
Krzysztof


