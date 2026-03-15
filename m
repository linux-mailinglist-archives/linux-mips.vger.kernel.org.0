Return-Path: <linux-mips+bounces-13646-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id APkHLGbJtmn6IgEAu9opvQ
	(envelope-from <linux-mips+bounces-13646-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Sun, 15 Mar 2026 15:59:50 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 29DDE2911C3
	for <lists+linux-mips@lfdr.de>; Sun, 15 Mar 2026 15:59:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id F40C530099A7
	for <lists+linux-mips@lfdr.de>; Sun, 15 Mar 2026 14:59:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B95E036C584;
	Sun, 15 Mar 2026 14:59:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=quora.org header.i=@quora.org header.b="jC8I11ww"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89A41336EF1
	for <linux-mips@vger.kernel.org>; Sun, 15 Mar 2026 14:59:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773586783; cv=pass; b=P09eLVKULO3cZTsQBint2b+50XPOsN/ubqbbQ52gR7NlhObywfyWNs0EAEbJXQ/Sp7AT1eEXj5XPvh6KSVx5dWC91Qgjq2e8Viyyhgl2F9rFDhEnZlWo25AwcUUVksHnzz7R8dzWGgbuMFhuhGNFlfuwQX8qcsgMcFWFZUtL5Yk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773586783; c=relaxed/simple;
	bh=cmAzdK8mJM/CEflDkCR6g0diVGaH9lYiVEHzSDqkev8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TXNsmzHoatAW3htI3VG57BZD6VznuZ4iVWPui77kv+A3R36lczdiJOZXY/JZYEMW65zcSEi7B0d5Dg57rT1dRkCd5/NHicjKHfqgEVGeU1qj05O1Mxet94a3vRonO72bBF1N2yyuHps4nKs7JYCUq6zdCFDr7Ih7iEoTkQI/+Mc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=quora.org; spf=pass smtp.mailfrom=quora.org; dkim=pass (1024-bit key) header.d=quora.org header.i=@quora.org header.b=jC8I11ww; arc=pass smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=quora.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quora.org
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2ad9a9be502so22596885ad.0
        for <linux-mips@vger.kernel.org>; Sun, 15 Mar 2026 07:59:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773586782; cv=none;
        d=google.com; s=arc-20240605;
        b=VsByy1kRqdmZHEK5YaicbNB9CnnBWHGM7f564y6pMrcnF9iWKpVYnF3fWOq+lHtDXX
         RYAA51lWB7TXsI0fklSNxpp8jdZNwHPu/FfH6/IB16yauhLyI9MccJeTyCrUcNLDYHQj
         I9lb9pzV+FHCcLoyX0q5ElKKShnbbMHYb9fqra3ZMvSBn+OXJgGq5BGkcplEHFk7mI2f
         p4OFIHDzA3//Ox3l4mh6cOy8mqedxJzywnOhSkb70upg0xpsgo11mLDQz6zMjXhIJbBp
         NmwB1JVc5wSzEe/fIWvCOde6dGJ+hE0IOK3TgJHr8IUU6wXPRQXi44KI3aeNhc3Ch8u6
         ZMuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=k2bgQXdn651hknnodZ1KyTxVyFIgCPV9YrQpZ4c7Bqs=;
        fh=fM1f8U6i4txxp/NSGqLqpnXouSl/Amlx8UdDMN4sAws=;
        b=Ct8XEcEPXr+D+yCtgEYW9yWPLwiHzzlKC9YfwTrIxRxuwMLn21Qbj/TonLPts+Z09b
         16szN28mL29W1rIvoQWcCMv09WYhOJMlcnz1WMT6HyMWbAaIR468OOwQZdgdnrVWw/+Z
         CvC4EzZ0ZE26aYdkwtCBykdsWHc5aYjnV56R4YlZQNjpC+Rk2NdUYGIENCzAkQXgbprC
         8Kwuz/9PQSjhhjdXrNpmR8VDpOA1Ckexb3jDC5jbcI3saDTVcLn6U/iTm/CGNpPINLLR
         9kpkmm/60Cu/ZMsNVE7T/G46xoAaP7CGHtRzxERyQ7RgvrL0vs6/mve4kgj6BbWAJ+8S
         M9Zg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=quora.org; s=google; t=1773586782; x=1774191582; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=k2bgQXdn651hknnodZ1KyTxVyFIgCPV9YrQpZ4c7Bqs=;
        b=jC8I11wwdDhXFFLiLxS2yYqWQewdJKEDu3VYBhnMh2Hpo4c8FyogwA5754BQ2ohOMW
         2CviQ6ahUEm9MXjHr3fqZzWAP5HpPakU/RJ52yCK299HU3u6bDwWLcHTOCsCoFB8kfjL
         /1CmhMM+hRg0XMIAL9mAYHW9nlKy1ec+ItMf0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773586782; x=1774191582;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k2bgQXdn651hknnodZ1KyTxVyFIgCPV9YrQpZ4c7Bqs=;
        b=gQ8Fqy8J+vY71R+cMnlxhXZB0y0J5to+BOlahdtgQqpnVio3kVDrH8UIyN1l6iJfs9
         gyAtsZXhCzE2okuWMqnZHvddN0JcvlMQ6mv6NPTspKfTnhXpOXaAtJ1E+LvodMIepgo5
         fxclan1HNDKiTxMi2J+cCbhGzrhBa22BW+tnHAaqtDBtPRr5aR466fIUZNRmyQQcOh9n
         45x2UlcxyJPMRQ/keLvvBigMHKciiktOXVweUkZJha8wvvJLAYmjU1/5Ra4Nsaynpc96
         KBtsrvji8zn750t8Wb/h1Wjytpmju6eua0YCDHRFPNHFR0i9y+d0JHwhCC4OydzK1fsQ
         zKuA==
X-Forwarded-Encrypted: i=1; AJvYcCVP+wHftFNUkfkrp/milr5Tt2FgHWNVVLxoAugT5KMsNZe/9+yFrNH+hxJWW/8pu8V/UdOCWM1F/Z7F@vger.kernel.org
X-Gm-Message-State: AOJu0YyUHG98d/+U89PTxm0tsYz0kNJyO6HqHsJqHrWXdKx+6zAzpdmd
	uYCjh42IAdUa/IHG0HicfGxzWMpXTWzu+kAXomY2OhmDmhdWlSQxFl1PN//nhSfkVnMFDREWXpK
	L2P8h9HZMwuzFYbPkFqAxohc+5JcnskNwaJ15EfpzoQ==
X-Gm-Gg: ATEYQzxMYsfyl44OVqfDsjjUfSCQ1tNtEtwl5zJnRkkoJUygg3QZdGRl1f6vB2s9KIO
	HFE2ZLL+hWWIkhOnMZOysflUjDHd2Pzk8ywO9Rk/t2OjSS32bSKjbYBYi0/MpS68ywtS4cIZdFR
	bS4JRhj1AbNIpPje/04LMP9+gvNkbDpJjxL0QEqXtU6m7yAnyjQAv0lQVIRT0Olikz3zJdrbNxh
	z0VyjPc7PzzKN0qbw2cchO/6DlY2onNSVyLdVW7BjLOaZwhXMcRulmnrb8buu0PfxJg3oXT7Lq/
	Nrt2WFHBrPmr2DGEXuulnvGW4F72xqQvSI161wK66+NTK41WkakkFb3WFkfrmFbj2RjfHrt6kut
	nRArwP6HrrpncSuW2iQhHhHyGGzivFlX2XWs5NqpaZcJDu2duy07hujp2b4NJT5ZQCNtBt3Sw1J
	S4nYor5mYiUl/qiqpKJWWNpQuj03Toy1ocs8qwaKw5+4qjwRZvWRRjLveAibE=
X-Received: by 2002:a17:903:230a:b0:2ae:45b3:b688 with SMTP id
 d9443c01a7336-2aecac5fa42mr109937075ad.45.1773586782009; Sun, 15 Mar 2026
 07:59:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260123230651.688818373@kernel.org> <20260123231521.926490888@kernel.org>
 <CAMVG2ssXZKmw-YTKB5=CvhEofKeyEfaBCDZbyzfUcm2+P5rQsQ@mail.gmail.com>
 <87jywvfkrs.ffs@tglx> <CAMVG2ssvadzUUoZw9xdYdZ4T5Sz+xdcQnXmU2NkR0N_yqieT=w@mail.gmail.com>
 <87ms0zva5i.ffs@tglx>
In-Reply-To: <87ms0zva5i.ffs@tglx>
From: Daniel J Blueman <daniel@quora.org>
Date: Sun, 15 Mar 2026 22:59:30 +0800
X-Gm-Features: AaiRm50I31eSF6801si99Y9EY7I9YjebUnwNHs2sMp21MNTfjKnyIHR7axGJPKI
Message-ID: <CAMVG2st0c7zoh-OYom_UwSA7WPDfRuM7f9gmt4pzU=Ap1Bm9Rw@mail.gmail.com>
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
	TAGGED_FROM(0.00)[bounces-13646-lists,linux-mips=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,google.com,redhat.com,infradead.org,linaro.org,amd.com,suse.de,gmx.de,alpha.franken.de,bull.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[daniel@quora.org,linux-mips@vger.kernel.org];
	DKIM_TRACE(0.00)[quora.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-mips];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 29DDE2911C3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, 23 Feb 2026 at 21:53, Thomas Gleixner <tglx@kernel.org> wrote:
>
> On Sun, Feb 15 2026 at 20:18, Daniel J Blueman wrote:
> > On Mon, 2 Feb 2026 at 19:27, Thomas Gleixner <tglx@kernel.org> wrote:
> > Good step forward! We can also reduce remote cacheline invalidation by
> > putting 'seq' into the cacheline after 'cpu_ts' by reordering:
>
> Good point.
>
> > With that said, with your latest change on the 1920 thread setup,
> > WATCHDOG_READOUT_MAX_US 1000 is still needed to avoid timeouts during
> > the previous adverse workload, however some timeouts are still seen
> > during massive parallel process teardowns.
> >
> > To limit overhead, perhaps it is sufficient to set the timeout to
> > 100us, avoid retries (as the hardware thread may continue to be busy
> > and will be rechecked later anyway), and log timeouts at the debug
> > level if at all.
>
> Something like the below should work even with 50us. I left the print at
> INFO level for now. We can either change it to pr_info_once() or to
> debug as you said.

My apologies for the delays!

Comparing the execution time of the existing mainline
clocksource_watchdog() to the proposed approach, there isn't
significant additional overhead [1], which is excellent.

With that said, on the 16 socket (1920 thread) setup, we see most
remote calls end up timing out with WATCHDOG_READOUT_MAX_US at 50,
leading to excessive logging. pr_info_once() would be a good approach
to avoid the spam, however I still feel we should use a higher
(250-500us?) timeout to keep the mechanism effective.

I also feel if a remote hardware thread is seen to timeout, retrying
has a high likelyhood of timing out also, so it may be cheaper in the
bigger picture to not retry. Sensitivity could be increased by walking
threads in socket order (S0T0 ... S15T0 S0T1 ... S15T1 ...). These two
items are my only concerns.

Thanks and great work,
  Dan

-- [1]

# bpftrace -e 'kprobe:clocksource_watchdog { @start[tid] = nsecs; }
kretprobe:clocksource_watchdog /@start[tid]/ {
  @lat_us = hist((nsecs - @start[tid]) / 1000);
  delete(@start[tid]);}'

Mainline idle:
[16, 32)       2.9% |@                                                   |
[32, 64)      96.0% |@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@|
[64, 128)      0.8% |                                                    |
[128, 256)     0.4% |                                                    |

Proposed idle:
[32, 64)       0.0% |                                                    |
[64, 128)      0.1% |                                                    |
[128, 256)    99.6% |@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@|
[256, 512)     0.2% |                                                    |

Mainline loaded:
[8, 16)        0.2% |                                                    |
[16, 32)      82.7% |@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@|
[32, 64)      17.0% |@@@@@@@@@@                                          |
[64, 128)      0.1% |                                                    |
[128, 256)     0.0% |                                                    |

Proposed loaded:
[16, 32)       6.2% |@@@                                                 |
[32, 64)      93.8% |@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@|
[64, 128)      0.0% |                                                    |
-- 
Daniel J Blueman

