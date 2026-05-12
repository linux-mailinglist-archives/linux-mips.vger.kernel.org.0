Return-Path: <linux-mips+bounces-14553-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0BohNQjhAmpEyQEAu9opvQ
	(envelope-from <linux-mips+bounces-14553-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Tue, 12 May 2026 10:12:56 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E51251C80F
	for <lists+linux-mips@lfdr.de>; Tue, 12 May 2026 10:12:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E6E983018437
	for <lists+linux-mips@lfdr.de>; Tue, 12 May 2026 08:12:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C52848AE30;
	Tue, 12 May 2026 08:12:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eeMjzPH6"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC16E47AF67;
	Tue, 12 May 2026 08:12:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778573567; cv=none; b=gBAfQBxiBtzIydHhBVe6OG3R3fzEV5if7T0F6znSY2UvOIm6Os19vkTArksPKP78tRJ41QjiUJahMEkETlaQndzchp5v56NNRioZRcvZevonWQHRioAmrNYIUZAA4Jl1fn6KKgTbp/6yQzSYXZmLG5PFS+pCtCRMQZrMxkdfEBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778573567; c=relaxed/simple;
	bh=iKoZSxz8wlSZlrKHB8el8X5w1WWSeeWHYoI1BzyYxx4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oQRTsBS90RwkzaWM9w66AmEAgK3qVOtMs/BKVkVxytD2NIoyyAXIy8ToXB3DBVCZcRECwum1nJj6dByJ4Gm4ttzoN/rVHQx3Sv58YgoAe9baHUdTifYhdHcpIPf5SOBN/iJ8Iqozz3IGpreKp9pSJRNiuzI8V15V0fXvrDKJoDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eeMjzPH6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A291C2BCB0;
	Tue, 12 May 2026 08:12:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778573566;
	bh=iKoZSxz8wlSZlrKHB8el8X5w1WWSeeWHYoI1BzyYxx4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eeMjzPH6Y/sUarT1XK6P0RpXt2R5PQui6P34ZNR8P61RgTyLW+wx+fF0hLkYfHGek
	 0i7+BKOZLYbYnc2Ia1YBYQgZ9oyxi5zfhhtybCJN6qK2egaD0RQ/WE7mnKj6g3y7xq
	 K/nNZjnHnsvLgH4uktUqbKKXHDpExs0QgdynJ7SnZJDH5eEbMJ3XNJv4UjbRq8szNt
	 joos0Nz/JUfqsu0Gefb2y26gQa2500/LCDc2r7MFKERI8aV81gRF34tJEcsXtb6NlN
	 iZf3gDCIOslXPYGu61cO+yjgfLLiFwya56pmodtdFhtMvlx9jUlZM/51eclhgFrVV5
	 tg9/16MhBQTSA==
Date: Tue, 12 May 2026 13:42:42 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Caleb James DeLisle <cjd@cjdns.fr>
Cc: linux-phy@lists.infradead.org, naseefkm@gmail.com,
	neil.armstrong@linaro.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, linux-mips@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] phy: econet: Add PCIe PHY driver for EcoNet
 EN751221 and EN7528 SoCs.
Message-ID: <agLg-thli6UXftpn@vaman>
References: <20260404184918.2184070-1-cjd@cjdns.fr>
 <20260404184918.2184070-3-cjd@cjdns.fr>
 <agBpBxofP00bAt7V@vaman>
 <23a04af8-beec-417d-8d3f-9d587bffe953@cjdns.fr>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <23a04af8-beec-417d-8d3f-9d587bffe953@cjdns.fr>
X-Rspamd-Queue-Id: 4E51251C80F
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-14553-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[lists.infradead.org,gmail.com,linaro.org,kernel.org,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vkoul@kernel.org,linux-mips@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips,dt];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sashiko.dev:url,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Action: no action

On 10-05-26, 13:25, Caleb James DeLisle wrote:
> 
> On 10/05/2026 13:16, Vinod Koul wrote:
> > On 04-04-26, 18:49, Caleb James DeLisle wrote:

> > > +		val = field_prep(data[i].mask, data[i].val);
> > Please see:
> > 
> > https://sashiko.dev/#/patchset/20260425173642.406089-1-cjd%40cjdns.fr
> 
> 
> I think this is an error in that the AI is not correctly differentiating
> between field_prep() which accepts a non-constant mask, and FIELD_PREP()
> which does not. In any case I can confirm that it does compile and work
> correctly on the device.

Right AI might be confusing FIELD_PREP with field_prep()! I will review
the series now

> 
> On another note, I think you may be the creator of Sashiko, if so, thank you
> for your work - it helped me with another patch already.

Oh no, I cant claim credit. It is not me

-- 
~Vinod

