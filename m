Return-Path: <linux-mips+bounces-14240-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2ILFINqM6WlwdAIAu9opvQ
	(envelope-from <linux-mips+bounces-14240-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Thu, 23 Apr 2026 05:07:06 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 2949344C747
	for <lists+linux-mips@lfdr.de>; Thu, 23 Apr 2026 05:07:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 39BC430065E0
	for <lists+linux-mips@lfdr.de>; Thu, 23 Apr 2026 03:07:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC6F03C6606;
	Thu, 23 Apr 2026 03:07:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ej1N1txR"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68A873C5523
	for <linux-mips@vger.kernel.org>; Thu, 23 Apr 2026 03:07:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776913621; cv=pass; b=Xq1aqc2iCui6eqG4fY+jzi8dwmO0VotjFS59VFptgFrUTBsqt3XEKzVajVNLMhdGD0WW6pzqW7oReXOzAlX4KH5RrCyOpojrMUgZ0FEPHPhji5yle2Rp1lzWfwcY1kPpjEP9quk2NPVogi2FSNuHK8HrNJ3Y/svZ8VQzviNFzeY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776913621; c=relaxed/simple;
	bh=XCLXDbphdhLQ8I7NEFQiQanixH7UqHhty+yjIG/7YyQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JOxQJIh6kWQKY+a0wlGtJhUZKt5PjlZC8fkRwgMq6sPgSkhrZXuZlJlHdejw5iT/ehxh4R7mD/uZrUVoSdrgHNhYVxTRgfnlMU33L5MXcJ/hVwN8gaAhaRzrJ8XKZX4rSjc0JTl5nl3nxAHS5UN5eSLBobXosATnpkUxF19QCP0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ej1N1txR; arc=pass smtp.client-ip=74.125.82.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-12db7bf1541so2454294c88.0
        for <linux-mips@vger.kernel.org>; Wed, 22 Apr 2026 20:07:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776913619; cv=none;
        d=google.com; s=arc-20240605;
        b=fkK2kp6OwfNE+0trQxUYEW+0JQr5wJNf0SJlohodsdMICDTl5b63oBngYPGt0r/i9H
         PuF2kCFzRJF5V1+ls4a2cooE2cIzTwKwcIYP0HOi28ZckdwhiiRNqviT15ij3r2YqQu/
         tpZ0FbT4OkqPvSu6Ld/t/xcoaT83j9hHuqFt9d6W72Epj4g6W/OphPbpBdBjHEnTgR2p
         qMLMxHEjBUX64JcOtJtst0/K1XbTWtCe+cLi0vr7TvvPKjKS6L1pJzRQFwQyX/4SsBac
         h401/kQlr6+LykxpGEFu2ltweZoX1O4JnlTE1PnVK5MvPhGDwAXr2kYkiywRm1pkkiEK
         APSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=XCLXDbphdhLQ8I7NEFQiQanixH7UqHhty+yjIG/7YyQ=;
        fh=lsq5gwU4Xn3Esa7+l+Xljb3HyMP8IUJdRxz1/aoB/40=;
        b=F0eB+jsa8NsmuWebSKlWfXuexuflo9+UP0a2zrv618O1doT2+HSqAQgvcoq5kZP67x
         wd3MG2DxRYlnGVtxwyaXAEsP8nq8rRR4zb16Pe3CCea3AdDjyQ9woI/s0o57O0BEiXZx
         cHLxb49I6uIrvqhL/ino6XWrWPd0mcBc1SUdPcZWBokuJVaniuG3UIL73s+0d/dGodn/
         RuHWSislnH774z3+rGbwdun9+Fmbecj6lmOTuyYsuo1YJXCZtZn8rCLuRhfqJBcRuBsz
         yHcJTs/67+l351n7RzRFCKiuMM028win92EmJR9MxOvJge38zoQ6t3FCY18vh31n0cIT
         VlfA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1776913619; x=1777518419; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=XCLXDbphdhLQ8I7NEFQiQanixH7UqHhty+yjIG/7YyQ=;
        b=ej1N1txRZVXBkMgsUrykOzJKn/MqbcJKlGZUKe4lnycAS8NPyPEpRLAX/T33qNpbS9
         eRJoKxAEZyLiBK0XaxPKYzkP6v1RdRdzOwch1CochPY75yyExkZdl6wqdB2UR/cT9KGN
         XS6J8CePVkHpDvfEW4eQ3Mh7qmCI2FXYBQs93+NBc34+3XUGu/xUCnwCWK+nlmDwd1gK
         rHk5TT9X7A0yrxByOGSigmQiST27c1mDDZDilDYcoGS/uJe9QNdS0trGyYnq2ohDmZIJ
         r0r9fj104cE5q4xv6IabjccFCCi347D2P/jbc5t1+zMCZJ7F1yjhcVjSa2peysZL8+hJ
         2YZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776913619; x=1777518419;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XCLXDbphdhLQ8I7NEFQiQanixH7UqHhty+yjIG/7YyQ=;
        b=P1DEKXC9OvZw0uMNQT98LsNe9MNmLnDnFepLJeYcPoRDm8YXqHNGsqO7jd4q5wrN1D
         iPEdm2i+BJuUN0FRIuBTH4RIBofPapnwExexjb3SbPEO8V8fkofeORJOVpu29PBT2VDF
         ikMudccPlC/BQXjB7C6p10t8nzvg79EgKqQjKEy03z0GVOIgldYPpq/ybAy7BGgn3jZd
         weY97ybi5gGBJ+A3IL03WOY1SzC68xLZzTzBBWbY4jU1xJaGeHg3EIRNVTkm7TL9ZwK1
         FotQ538yOA00lPnUCwdkRcWOq4rhgAN096gD2/SpQkWWoLvBzBbMgQVTH/hiKT8ARJde
         Z6fA==
X-Forwarded-Encrypted: i=1; AFNElJ/TqmD0ei2b9951s+Bim1mRi0ABr1xqJlayVXGmZ94Q3BKePmqND4d2vLsQQUcfWvXYfL/PKBlODbSN@vger.kernel.org
X-Gm-Message-State: AOJu0YyUCYBnH2oAZp5zbitRxJnCtzJ0fbkkWZB54MlgDLE0wBYd87Ix
	+R+eN8ktUxMjRHcS8WiyHaY5RHJ12e1xw+19ctGseogFITMUWu/t8HsipJhqdVK23uirBvnwn5Y
	CESZyPFWJCtU0U98Xsp6GRI1W9ItkmO7PqCH0Tb/o
X-Gm-Gg: AeBDiev0n4JlXXYrBxgS0eq71+ynl35xG+R1E6H42rBA9gPdqC7dC0HL4KCAYr7ojR3
	Yx9XyhEiyEmcovVzyNUOuNyPgCeQGoLdwPerN67JBNSssriTgF62mi3uaG3Ock3Y6zxGaHZLs8e
	AMiGOGMGmXWE9wTH2NsRcPUN+3Uiw4+Wo4q1R5Cjr4X+M/RVgh/iPhAu6aqwRrmb9U3xl1plcoN
	Uo4b6c8JRvfjg/56m7u9rKO7BKTodjk9+Q1qIWNnxCfpk6l0oCbx68Cx0+2GvFK9Dt7X/4RMpAT
	u/qO4CxJXrmtSmf/2dah5Fm5n4sake4TrFf2aeobl3M7KWc6vqhccczpuDGvsjpWaDq8fjv0PsK
	5J8C6rlmSU2St8WIWeRAfxNR/syoMha4v08hLx27H1feeXeccAOToMMrtO7dXBT72de8AHosc7g
	==
X-Received: by 2002:a05:7022:eac8:b0:12b:ec96:c936 with SMTP id
 a92af1059eb24-12c73f70bc8mr14367576c88.14.1776913618818; Wed, 22 Apr 2026
 20:06:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260421021824.1293976-1-kuba@kernel.org> <20260422104522.GK651125@horms.kernel.org>
In-Reply-To: <20260422104522.GK651125@horms.kernel.org>
From: Kuniyuki Iwashima <kuniyu@google.com>
Date: Wed, 22 Apr 2026 20:06:47 -0700
X-Gm-Features: AQROBzB6Gd9vT7YrdkLSBHh2mcbacrp5O3_yj1j4ISHF0fFTaxESKOHzNGh7T24
Message-ID: <CAAVpQUC8N5+V+ZSq_=TVf5N2f=L71vrRsyo65U96V17as8+0kQ@mail.gmail.com>
Subject: Re: [PATCH net-deletions] net: remove ax25 and amateur radio
 (hamradio) subsystem
To: Jakub Kicinski <kuba@kernel.org>
Cc: davem@davemloft.net, netdev@vger.kernel.org, edumazet@google.com, 
	pabeni@redhat.com, andrew+netdev@lunn.ch, Simon Horman <horms@kernel.org>, corbet@lwn.net, 
	skhan@linuxfoundation.org, federico.vaga@vaga.pv.it, carlos.bilbao@kernel.org, 
	avadhut.naik@amd.com, alexs@kernel.org, si.yanteng@linux.dev, 
	dzm91@hust.edu.cn, 2023002089@link.tyut.edu.cn, tsbogend@alpha.franken.de, 
	dsahern@kernel.org, jani.nikula@intel.com, mchehab+huawei@kernel.org, 
	gregkh@linuxfoundation.org, jirislaby@kernel.org, tytso@mit.edu, 
	herbert@gondor.apana.org.au, ebiggers@kernel.org, johannes.berg@intel.com, 
	geert@linux-m68k.org, pablo@netfilter.org, tglx@kernel.org, 
	mashiro.chen@mailbox.org, mingo@kernel.org, dqfext@gmail.com, 
	jreuter@yaina.de, sdf@fomichev.me, pkshih@realtek.com, enelsonmoore@gmail.com, 
	mkl@pengutronix.de, toke@toke.dk, kees@kernel.org, crossd@gmail.com, 
	jlayton@kernel.org, wangliang74@huawei.com, aha310510@gmail.com, 
	takamitz@amazon.co.jp, linux-doc@vger.kernel.org, linux-mips@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[google.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-14240-lists,linux-mips=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[46];
	FREEMAIL_CC(0.00)[davemloft.net,vger.kernel.org,google.com,redhat.com,lunn.ch,kernel.org,lwn.net,linuxfoundation.org,vaga.pv.it,amd.com,linux.dev,hust.edu.cn,link.tyut.edu.cn,alpha.franken.de,intel.com,mit.edu,gondor.apana.org.au,linux-m68k.org,netfilter.org,mailbox.org,gmail.com,yaina.de,fomichev.me,realtek.com,pengutronix.de,toke.dk,huawei.com,amazon.co.jp];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kuniyu@google.com,linux-mips@vger.kernel.org];
	DKIM_TRACE(0.00)[google.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-mips,netdev,huawei];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 2949344C747
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Apr 20, 2026 at 07:18:23PM -0700, Jakub Kicinski wrote:
> Remove the amateur radio (AX.25, NET/ROM, ROSE) protocol implementation
> and all associated hamradio device drivers from the kernel tree.
> This set of protocols has long been a huge bug/syzbot magnet,
> and since nobody stepped up to help us deal with the influx
> of the AI-generated bug reports we need to move it out of tree
> to protect our sanity.
>
> The code is moved to an out-of-tree repo:
> https://github.com/linux-netdev/mod-orphan
> if it's cleaned up and reworked there we can accept it back.
>
> Minimal stub headers are kept for include/net/ax25.h (AX25_P_IP,
> AX25_ADDR_LEN, ax25_address) and include/net/rose.h (ROSE_ADDR_LEN)
> so that the conditional integration code in arp.c and tun.c continues
> to compile and work when the out-of-tree modules are loaded.
>
> Signed-off-by: Jakub Kicinski <kuba@kernel.org>

Reviewed-by: Kuniyuki Iwashima <kuniyu@google.com>

