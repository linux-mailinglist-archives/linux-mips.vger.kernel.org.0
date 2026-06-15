Return-Path: <linux-mips+bounces-15084-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id YM8KHlDYL2pGHwUAu9opvQ
	(envelope-from <linux-mips+bounces-15084-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Mon, 15 Jun 2026 12:47:44 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 150CC68571B
	for <lists+linux-mips@lfdr.de>; Mon, 15 Jun 2026 12:47:44 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=IZr9HbPx;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-15084-lists+linux-mips=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-mips+bounces-15084-lists+linux-mips=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 76BFF3008260
	for <lists+linux-mips@lfdr.de>; Mon, 15 Jun 2026 10:47:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3AF06330644;
	Mon, 15 Jun 2026 10:47:41 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03C7F40D586
	for <linux-mips@vger.kernel.org>; Mon, 15 Jun 2026 10:47:39 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781520461; cv=none; b=F2pWvook/e9NaFW7DqKZql6mfZoh+VS1xpUDRK+DM55OgqgjCe9ldu+SNFAzJrJh97XmMJ0sIxvTEEpmZ1kmzHdORdHN9OdVrXa5dEmnnMtl9MmvzFgiqVTXW+UTDDpik9XPiwrH6YdRWiFHkOdl2jkqO3kzv6nl7d2uZOof78s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781520461; c=relaxed/simple;
	bh=a6XXKQNX/IcBjOxkSTeiKErHC/eDiRukExqbkmBpiJA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X1t4It4xRWP3Mb3Q/6nCy3jZwzD78r3AOtRyV7czL5HT/Qbass0Y2VM0QaDjEF59ImPKWzHyfqe4B5zkeZbrAY9oHIvyPg8RRGlv87MBYnvdqceXc7WlL6oVITXsBaB1UvdbYMEd7bKZm2+WV00IILpiaoNHg/UIvPrAkExuO2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IZr9HbPx; arc=none smtp.client-ip=209.85.160.179
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-51764768c36so45863721cf.0
        for <linux-mips@vger.kernel.org>; Mon, 15 Jun 2026 03:47:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781520459; x=1782125259; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=M64rJJ1xZSLiHxwrl9p8ksJIU6OsymBXvzM1BXThTtw=;
        b=IZr9HbPxlC6YjpwMAL1VGszk4a8xtsrmiRm6ELanWL/8ilj6Fu84kyfNmIzj0k+GzN
         v5pgLkxVHS7sxkZF6BIKi18oAN3sKk1IP3YbFKQEKsFTTYVvSplNmWM8Z9+ozSKsMnvR
         JOkvu2XNfSTr4Fw5vE92uLd+aXitA3t8I2dTPn3le7gPv95qobioMn2aIFn58wILMHk6
         TweHNBEhmtUmGa2TftJ2SBak2eq42ee9R8J+bTxjUliYr47qE/5p71508pd4fXpiSNaO
         gICs5OCvxHO3USxWIjmFnxCSOEIEFzScUIiJXUXIG8T8YjC3qLO03wyqDc4HgFlEqwtb
         bRdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781520459; x=1782125259;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M64rJJ1xZSLiHxwrl9p8ksJIU6OsymBXvzM1BXThTtw=;
        b=mqSXegNzKCJhEqEDstil8gMDiwLABS4PvGr750Z+v3fRmAxHnnvCSwsisBkZuB19Ps
         OAUwQCQmTwsKGuDuR+Vn6s8iwKu4UGqZ5JzTjXcTxaJw59NxSSo0t5qjBhuwtOOeUQ7h
         tMHq4mEvqgIqYE6ZDdMN+AWZC9wMwcMx6dffp4moDTb8xJuMpPHk+Qx5NNy4NnAmFRsy
         eH9cKEDGJyppQfruoMsMv7/Qjvg/maRkTa5UzFljKYQQCOB81PMLWy7vJ1MJleyE+JkP
         pJqbGxhkGOKN16Mgrq733hrqfSHKPDsTs4tDskvTQGCAd+u/hkCijw2HjErvHsE4AWuY
         1DEg==
X-Forwarded-Encrypted: i=1; AFNElJ+hzaVrXcu943CTbXb1E0w8zq1qDj9DuR0OtCqWipDvx31a/q/6F53zt02xj3NtdGlySQuSrXDq76W9@vger.kernel.org
X-Gm-Message-State: AOJu0YxzSO7RMX5NOmKAH0BiFCgxgieyFnSIVrQgpEdEzURb0TeJ1+0Z
	S36ABMH5MPKdMXjHI7chykXHk7sAA/xV0hxLoxhZY1/kOPZBfIfelgnF
X-Gm-Gg: Acq92OGguz7t2wgum2U4Vx3hTSnYv4J1HtrE1gQilU/iM/3fgg2yW+o6qojL76o8GgU
	LKuDMnfQpdRHDnPIaM6HfwzYuzmrW0QBb6uoMfZtTcpmMOZqZl+jY2tv+y8svkWu1KW5fF6XgY/
	XbSfA1PHtC3EM3MfcxlZjaK/BSQ7Vw3gBEobE7XinXnYKkFW0x3hj1p5g44ceMYRnI4YpsaqiKc
	9emXO2rxcNLuZ2VEyCZCKuIPgO16vQXECW6Kr15BxIMRhab3kTA2RfZ7D3xmOAdcr7+z9pDA70f
	XPr+Lm3Ch5LNjgo+lCj+7YHkD3NQ5hbW2WLVPJf7RpT2Uw2feD/ckaG1ilYasUTRNqDohAJJXp/
	qi/POytexeSTPAdvbwysyIMFqTbZKqCxQtZTlGop6DO2p1h0+xg0gfGK8y7irx0L8BZGrV7wqaP
	yINJkPq7Wk0lSsPuJq
X-Received: by 2002:a05:622a:1b28:b0:517:9407:5c35 with SMTP id d75a77b69052e-519536f0741mr170037011cf.47.1781520458986;
        Mon, 15 Jun 2026 03:47:38 -0700 (PDT)
Received: from localhost ([43.225.189.75])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-517fb544533sm103003211cf.0.2026.06.15.03.47.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 03:47:37 -0700 (PDT)
Date: Mon, 15 Jun 2026 13:47:31 +0300
From: Dan Carpenter <error27@gmail.com>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: Markus Elfring <Markus.Elfring@web.de>, linux-mips@vger.kernel.org,
	LKML <linux-kernel@vger.kernel.org>,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH 4/4] MIPS: kernel: proc: Delete unnecessary braces in
 show_cpuinfo()
Message-ID: <ai_YQwmgIFgWj0tj@stanley.mountain>
References: <e9e46083-c250-4e12-8620-f590e9501a25@web.de>
 <7c7d97b0-37bb-4e7b-9b2e-49a7c10eb6c5@web.de>
 <ai_UUB7ouRSE1KEw@alpha.franken.de>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ai_UUB7ouRSE1KEw@alpha.franken.de>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-15084-lists,linux-mips=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:tsbogend@alpha.franken.de,m:Markus.Elfring@web.de,m:linux-mips@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:kernel-janitors@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[error27@gmail.com,linux-mips@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[web.de,vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[error27@gmail.com,linux-mips@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 150CC68571B

On Mon, Jun 15, 2026 at 12:30:40PM +0200, Thomas Bogendoerfer wrote:
> On Thu, Jun 04, 2026 at 07:56:12PM +0200, Markus Elfring wrote:
> > From: Markus Elfring <elfring@users.sourceforge.net>
> > Date: Thu, 4 Jun 2026 19:15:15 +0200
> > 
> > Do not use curly brackets at one source code place
> > where a single statement should be sufficient.
> > 
> > Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>

Generally, in most kernel subsystems the rule is that multi-line indents
get curly braces for readability even when they aren't required because
of the syntax.

regards,
dan carpenter


