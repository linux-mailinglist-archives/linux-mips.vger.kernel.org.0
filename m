Return-Path: <linux-mips+bounces-13793-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cGuQOUyvvGkv2AIAu9opvQ
	(envelope-from <linux-mips+bounces-13793-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Fri, 20 Mar 2026 03:22:04 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FEE42D51CA
	for <lists+linux-mips@lfdr.de>; Fri, 20 Mar 2026 03:22:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6BE92302085F
	for <lists+linux-mips@lfdr.de>; Fri, 20 Mar 2026 02:22:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9CF029ACF6;
	Fri, 20 Mar 2026 02:22:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=quora.org header.i=@quora.org header.b="f5//oBDP"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEFDBA95E
	for <linux-mips@vger.kernel.org>; Fri, 20 Mar 2026 02:22:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773973322; cv=pass; b=spgoeOKZVi+JUB+6NVXsoUEqHI9CW/+6nofjM3t7Gk5wZs+mIZwx2UDteiHSn/xGOm/buzT13MahCyEgzaXs2V5S6V1kJ4fGJIO9DTy+quVFvYUf73/vul+OX/J+WKe6v68vaK5WOXKOjGuN47bSfLo+aG8XJ3E2KEJIsMl2jrw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773973322; c=relaxed/simple;
	bh=Xgwoo7xJJ12b4FQCY3ThOCsuhkvI+Io4glEZX877rGo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RRcG+RwGtlFNd6cS5zvPLxovRyx/Xc3QNJVf/JHLcIi6WXjeEzzK0kd7A58UDNPWplYJM5AObo4breMw9oAUtCwQ5tWs/Yjn7jRAC84JYlTLX0z/etCZfpK2EvEVJUzDRD6j5aDIDVv/xMTtEvxJoV1CLjjsyXZ8zeM8nVX69Fs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=quora.org; spf=pass smtp.mailfrom=quora.org; dkim=pass (1024-bit key) header.d=quora.org header.i=@quora.org header.b=f5//oBDP; arc=pass smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=quora.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quora.org
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2b062069f80so1372995ad.0
        for <linux-mips@vger.kernel.org>; Thu, 19 Mar 2026 19:22:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773973321; cv=none;
        d=google.com; s=arc-20240605;
        b=AQqiBYatFNqmYGVJtW6vMLBOSH9h06wKIWewZtEh1rQ9boLmxemti9uvZV2clZ+KXh
         QwtOe/c9GGaW2rkgzDdOvnD3IEWf5170cYWSWN/ni4ZmwIGnH2HuBzDjzcKp4+111BJz
         v2wSTXn61vOi6hV5017SJQWPktAFAmFBztiw9gSZn5BOlgmPFbXnxEddme4yGszmzkzu
         05K2MvpQqvERUpKzqnQzNYEWDAQ2/czsL9cxCWScQCtS87fbAwYTtgq5LSRBQl77WfyL
         1tBjHOnajglZnPcG3UBJwuv7YMM6aC5IofKhq5aat6htYZtca1kTPveOIZPVO0q+pKBz
         KQUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=15l/a+mX0jrY2HyrX1uNSgJuYoF2zhV3sIbAZuvV4Sg=;
        fh=X+wCSuJ5gpQ7jxDvDY5rui9o7JcUomKxw4H/dN2r928=;
        b=L8scWOypu9/yM0vRBsgfj8r6LvEuNYj9Ax9JeP8Gj9Qkgn7vPgzO7avphCS2qctuap
         FDZIKlcWweVNbqc/8KvfDaVA6f6X96IveiRbLkE5pvD63GJN7k/eNJW+RhTheMxjLMy2
         vqMsjK4395SHjzozaeBXLjZiIpJtz/jbYynNvB2m8keumaU0qPz1md1UUG63cHn8lvMi
         M9F+WXX7TObfiftzj04p8UrnK8MsMCyfn8kfJIPadCf5MWav3lmiqbYSXKNkRBJN19iP
         +pNhdcPIg/0tLTngxAPtNg4Vn8uEnAXTxSM224LRudARbCqerV40QIfbxOYn2pNfmHSc
         Knxg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=quora.org; s=google; t=1773973321; x=1774578121; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=15l/a+mX0jrY2HyrX1uNSgJuYoF2zhV3sIbAZuvV4Sg=;
        b=f5//oBDPy8PxDeYLPdlX6to3sdoj7BWSmE25gDqrGDnbSMEnkkleyyjZhjKWbhCpcq
         rN8ZUp2p2pQzUes++RZ4LezAN4Of1KsLz7Uzdh9tvw1hOmNzJCnTu0InqyozCe4wJVox
         1tWF8cbY+7dwKO/3Tb7Mxn0ChOYJfRwTvIINc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773973321; x=1774578121;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=15l/a+mX0jrY2HyrX1uNSgJuYoF2zhV3sIbAZuvV4Sg=;
        b=K4mHvOqNDoyCBbPeXXfBGP9JkyRCPFaVyjlhf4yZvg4SmgFZx9deCYHdWrlmMRmBwj
         P0aaAb4E4oxWPtTKsF7vdtn5jEFgRVY/aw0ImdSzxROkMf6wjBZCRX3VpkvyYY2QZ0hO
         PGj//KMvop69ldYGW9HztMOWVRUZpDvIgf1r+7+oXEYlFyEf7xjXuKJwggHt7/0Lz/hQ
         jLxKkKuWQ2unP6f1PbuW3esY1bm7/FkBekUEKU+vRKRAufA72kA3sjffWptAB/E5BnSg
         u+hHOhDu+7bPozBA3bEd9PhOED6ksltaTuhq6pNRf96N4GS9VW3TUh4bHfzP+y8FDOUo
         7usQ==
X-Forwarded-Encrypted: i=1; AJvYcCU5GK4ygc1Mq95Ldu2m63tx92vTi3Fv/WhYXoDOMLwHJHWb+2meMz1xVwvEqxHuAXsu+q9wRq2Dob8U@vger.kernel.org
X-Gm-Message-State: AOJu0Yzv5xxRyNH2f+zOksBYILgJMTZHipOgDMwILorxM1bumxzWHeig
	UmbicMZCogi0FAowVNNFtR3n9nr2aTw9tVXjj8RrHF7f6kNKT5F0LVcQVfeRdnfKYJLgiDRJkZ/
	S5UD2nKRWml5abEkZMoc3nrAdFZTkmeM6QHSuCGJHSQ==
X-Gm-Gg: ATEYQzz+eU0PSppjNhfbcRvlKr3gE+mTS4ff2UiA9lPxwFX/dOQU4Rjel01T9ghKHM2
	Gd8uAbr98p9BT1HDgJ8U50S092TKWT7/HPbBy6BWW94fFe/DOvEiYb4BBID2vPGeqVm+OEMJS4/
	4WuC/Bjj47R6kt/qdA0uLI460XyqYojh3f8IfXtxvzyaDK9A7tKv2ruzMWtJ/yxfgXsOjOVeUYL
	THA8LJG62FeKKqjbafD9iXGKCFlz8jGFm6wCTc7aY7Xy8Ys1b6upw133o/0WTiZbI0KNVLj/Mgf
	NrU5vWm8I7neSs1gWXleRxDuqwro3VfwJoBeO7VrjDxoVaAmUogt3UySlLHjuFq8Y7u0ugdFW0m
	7ncMOgCpWT7kB0gF8cSqpGu0wZksCA0FfSdr5WkTMyKz+f47JxERXMyWulLs16r0Z8AyKJiVSqT
	4YrZJmg1gowKfmkzERh/k8HDD4Y5y3oyHk7WhN3auVuP/QizA=
X-Received: by 2002:a17:903:244b:b0:2b0:68d1:2537 with SMTP id
 d9443c01a7336-2b0827e3487mr11974105ad.42.1773973321142; Thu, 19 Mar 2026
 19:22:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260123230651.688818373@kernel.org> <20260123231521.926490888@kernel.org>
 <CAMVG2ssXZKmw-YTKB5=CvhEofKeyEfaBCDZbyzfUcm2+P5rQsQ@mail.gmail.com>
 <87jywvfkrs.ffs@tglx> <CAMVG2ssvadzUUoZw9xdYdZ4T5Sz+xdcQnXmU2NkR0N_yqieT=w@mail.gmail.com>
 <87ms0zva5i.ffs@tglx> <CAMVG2st0c7zoh-OYom_UwSA7WPDfRuM7f9gmt4pzU=Ap1Bm9Rw@mail.gmail.com>
 <87h5qeomm5.ffs@tglx> <CAMVG2stkXYJqrcaYpiPu0No=rTo8W+MxZZNZp6wjBE3sEphR8A@mail.gmail.com>
 <877br7muhg.ffs@tglx>
In-Reply-To: <877br7muhg.ffs@tglx>
From: Daniel J Blueman <daniel@quora.org>
Date: Fri, 20 Mar 2026 10:21:49 +0800
X-Gm-Features: AaiRm53JvLQ1u0bQvPb7I_V5ZTWXhWJZTDukmq120HSb8ZVoBYjkq1f6a1uKhJg
Message-ID: <CAMVG2suiGVveCbg=0w2c2FnP4QuA97=Za70XuKQAXotsyYfkSQ@mail.gmail.com>
Subject: Re: [patch 5/5] clocksource: Rewrite watchdog code completely
To: Thomas Gleixner <tglx@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, "Paul E. McKenney" <paulmck@kernel.org>, 
	John Stultz <jstultz@google.com>, Waiman Long <longman@redhat.com>, 
	Peter Zijlstra <peterz@infradead.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Stephen Boyd <sboyd@kernel.org>, x86@kernel.org, 
	"Gautham R. Shenoy" <gautham.shenoy@amd.com>, Jiri Wiesner <jwiesner@suse.de>, Helge Deller <deller@gmx.de>, 
	linux-parisc@vger.kernel.org, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	linux-mips@vger.kernel.org, Scott Hamilton <scott.hamilton@bull.com>
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	R_DKIM_ALLOW(-0.20)[quora.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	DMARC_NA(0.00)[quora.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13793-lists,linux-mips=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,google.com,redhat.com,infradead.org,linaro.org,amd.com,suse.de,gmx.de,alpha.franken.de,bull.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[daniel@quora.org,linux-mips@vger.kernel.org];
	DKIM_TRACE(0.00)[quora.org:+];
	NEURAL_HAM(-0.00)[-0.952];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-mips];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 6FEE42D51CA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, 20 Mar 2026 at 04:31, Thomas Gleixner <tglx@kernel.org> wrote:
>
> On Wed, Mar 18 2026 at 22:10, Daniel J. Blueman wrote:
> > On Tue, 17 Mar 2026 at 17:01, Thomas Gleixner <tglx@kernel.org> wrote:
> >> V2: Make it more cache line friendly and tweak it further for insane big
> >>     machines - Daniel

Reviewed-by: Daniel J Blueman <daniel@quora.org>
Tested-by: Daniel J Blueman <daniel@quora.org>

Thanks,

  Dan
--
Daniel J Blueman

