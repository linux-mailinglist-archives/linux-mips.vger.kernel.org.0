Return-Path: <linux-mips+bounces-13627-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MGIzOvCttGmDrwAAu9opvQ
	(envelope-from <linux-mips+bounces-13627-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Sat, 14 Mar 2026 01:38:08 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 611F928AFB9
	for <lists+linux-mips@lfdr.de>; Sat, 14 Mar 2026 01:38:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 700943044647
	for <lists+linux-mips@lfdr.de>; Sat, 14 Mar 2026 00:38:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 596ED2BDC0C;
	Sat, 14 Mar 2026 00:38:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MaBLduxH"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3492629C33F;
	Sat, 14 Mar 2026 00:38:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773448684; cv=none; b=f81q24CE4NOd7mE/iHi7I1p+/rEy4aPZCxbscBhVd33fPMstLgw/WZdLbACiXxDtcqy3hIReORVtDbaukG+BeRmQJ1KjCrtqvddBkO/YIdhqMxAtWbD9lxC+TFwAR9K1yNWrtR4afCne3oXAZo1m+WXdnP2LmKt0KdlgmaXx+/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773448684; c=relaxed/simple;
	bh=FD2WS5RUbvHH16+jWCJnePbwNK7/fnFcOqm+8udtIXs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Kr32MjQLGODEX0HiEjlE1LB3Iu/Czq59tw5juvBMvIVixmFNv9P8qzTX6UtJBlkeTGmqs10LCHQk/MonUOu3TLHSljKGcVOrEUiP4MLBMI2GuD59D+O40phJloI9Pq9fDJyjX5JfYX0+Z5EYQppAieJ0iRqgSMdekJEAWSL8yew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MaBLduxH; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE12EC19421;
	Sat, 14 Mar 2026 00:38:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773448684;
	bh=FD2WS5RUbvHH16+jWCJnePbwNK7/fnFcOqm+8udtIXs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MaBLduxHXQeby8WUhwBtXYXPGvaXz7v8z0oXbe/J9xTVslw5VS2qArJZxhcnh0pC+
	 m9DDUnKsDTaPCfLh/6dmIwyZfVpjykneYzJcylYL4kq06KgC32qhV7GAeyZ7bJk5ut
	 IbO1qerJVbZhMRPvleSyKK3c24CjNZ0wNd/q5dhcyU1TgJABq2Z8t5eSCJ2hTWl0TK
	 njl3B0XVm18Ly3HLxflliV1g8r7Q4DKPHJ4Z4ot2B4jKSCsJniyEzvBHYCk9c8sg/D
	 rEZZEAENkBoOIG7SQ4fPDQ2kC63ODLq0VKhAq6WXaBitT0VSqjqvzMTI2cmz1blXf4
	 qt2zIbFd9M0/Q==
Date: Fri, 13 Mar 2026 19:38:02 -0500
From: Rob Herring <robh@kernel.org>
To: Caleb James DeLisle <cjd@cjdns.fr>
Cc: linux-clk@vger.kernel.org, linux-mips@vger.kernel.org,
	naseefkm@gmail.com, bmasney@redhat.com, mturquette@baylibre.com,
	sboyd@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	lee@kernel.org, p.zabel@pengutronix.de, nbd@nbd.name,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: clock, reset: Add econet EN751221
Message-ID: <20260314003802.GA3735730-robh@kernel.org>
References: <20260312162449.569359-1-cjd@cjdns.fr>
 <20260312162449.569359-2-cjd@cjdns.fr>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260312162449.569359-2-cjd@cjdns.fr>
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,redhat.com,baylibre.com,kernel.org,pengutronix.de,nbd.name];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13627-lists,linux-mips=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-mips@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-mips,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 611F928AFB9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Mar 12, 2026 at 04:24:48PM +0000, Caleb James DeLisle wrote:
> Add clock and reset bindings for EN751221 as well as a "chip-scu" which is
> an additional regmap that is used by the clock driver as well as others.
> This split of the SCU across two register areas is the same as the Airoha
> AN758x family.
> 
> Signed-off-by: Caleb James DeLisle <cjd@cjdns.fr>
> ---
>  .../bindings/clock/airoha,en7523-scu.yaml     |  6 ++-
>  .../devicetree/bindings/mfd/syscon.yaml       |  2 +
>  MAINTAINERS                                   |  2 +
>  .../dt-bindings/clock/econet,en751221-scu.h   | 12 +++++
>  .../dt-bindings/reset/econet,en751221-scu.h   | 49 +++++++++++++++++++
>  5 files changed, 70 insertions(+), 1 deletion(-)
>  create mode 100644 include/dt-bindings/clock/econet,en751221-scu.h
>  create mode 100644 include/dt-bindings/reset/econet,en751221-scu.h
> 
> diff --git a/Documentation/devicetree/bindings/clock/airoha,en7523-scu.yaml b/Documentation/devicetree/bindings/clock/airoha,en7523-scu.yaml
> index a8471367175b..eb24a5687639 100644
> --- a/Documentation/devicetree/bindings/clock/airoha,en7523-scu.yaml
> +++ b/Documentation/devicetree/bindings/clock/airoha,en7523-scu.yaml
> @@ -32,6 +32,7 @@ properties:
>        - enum:
>            - airoha,en7523-scu
>            - airoha,en7581-scu
> +          - econet,en751221-scu

AFAICT, 'econet' is not a vendor/company but a family of products. The 
vendor is still airoha.

Rob

