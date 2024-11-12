Return-Path: <linux-mips+bounces-6722-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 29AA69C5A0E
	for <lists+linux-mips@lfdr.de>; Tue, 12 Nov 2024 15:15:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4F407B33187
	for <lists+linux-mips@lfdr.de>; Tue, 12 Nov 2024 13:24:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2685F13B2A9;
	Tue, 12 Nov 2024 13:24:43 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from angie.orcam.me.uk (angie.orcam.me.uk [78.133.224.34])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6CF53433CB;
	Tue, 12 Nov 2024 13:24:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.133.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731417883; cv=none; b=NcqAGBYvZomuDwMkgS3Y2q+uBRWm6/DAeno2M5KtfVzFlL2LOMw7d1zy/u3WA1D5Spk2VW6hanIZv2Jp3Ng9BNsyih9digl3rKNXNYV92Pn2M9mx+2YvKYUZ4f3zvNHQwTQC78JmXDNS+RsNTV6nqq2KhTBhMZAdie9zeAlFgMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731417883; c=relaxed/simple;
	bh=9ux0VEks/YvzhnK2ND6k+YKV5bzgYMpLaydEmGHI22g=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=o2v9/kS8ZaAiI63RnE5J0ZtYM0HlxsFuVv/hT/5l0cfJKKwxhmG8iQ6mFXR3Oho3EkD7O6IOSpdAMNFZFfRU0+lvevAFytPXHS3bieebYcu0KKs+jm6WOMwEWxJmkxHm0F086Ok+vkG1FpDMpMApNNIN+GtDYUxLnUQLRtN0CKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk; spf=none smtp.mailfrom=orcam.me.uk; arc=none smtp.client-ip=78.133.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=orcam.me.uk
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id 4F72092009C; Tue, 12 Nov 2024 14:24:33 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id 4953092009B;
	Tue, 12 Nov 2024 13:24:33 +0000 (GMT)
Date: Tue, 12 Nov 2024 13:24:33 +0000 (GMT)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: zhangjiao2 <zhangjiao2@cmss.chinamobile.com>
cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] TC: Fix the wrong format specifier
In-Reply-To: <20241112015608.3498-1-zhangjiao2@cmss.chinamobile.com>
Message-ID: <alpine.DEB.2.21.2411121320110.9262@angie.orcam.me.uk>
References: <20241112015608.3498-1-zhangjiao2@cmss.chinamobile.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 12 Nov 2024, zhangjiao2 wrote:

> From: zhang jiao <zhangjiao2@cmss.chinamobile.com>
> 
> The format specifier of "unsigned int" in pr_info()
> should be "%u", not "%d".
> 
> Signed-off-by: zhang jiao <zhangjiao2@cmss.chinamobile.com>
> ---

Acked-by: Maciej W. Rozycki <macro@orcam.me.uk>

 Good catch, thank you!

  Maciej

