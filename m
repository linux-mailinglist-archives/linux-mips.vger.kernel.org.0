Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 50F78262A7C
	for <lists+linux-mips@lfdr.de>; Wed,  9 Sep 2020 10:37:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726535AbgIIIhS (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 9 Sep 2020 04:37:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39844 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726293AbgIIIhS (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 9 Sep 2020 04:37:18 -0400
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com [IPv6:2a00:1450:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E02BCC061573;
        Wed,  9 Sep 2020 01:37:17 -0700 (PDT)
Received: by mail-ej1-x643.google.com with SMTP id q13so2318846ejo.9;
        Wed, 09 Sep 2020 01:37:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:date:to:cc:subject:in-reply-to:message-id:references
         :user-agent:mime-version;
        bh=Noo3UKIz6eixoV9cUm0tMx6veXOTEv85/CVG2wDCJ38=;
        b=UtM/b9gMnxs0qhGhYvm0dCzTEBcPyD56PlS2vDQOS0By4j2Am1WDsZyWFgr4hmmz5P
         IrowW9xsStMtxIkgiILSwEw+GNfWCaWKwL2q8Oi1C9eRYkixJEbUtgWYJjW3t5Rxa36A
         SzTdju2Dm5LRl/ZOLJY18Hj6lGEmvA8ndDH18hsuEdmIiQCQCAmV2Gjv+2pesvP7+2Qv
         6H3338FcjOKRXX8QTx+036jNunqFzPykurd6OsbVh3SBTmiwiN4S2Px0A/IWxPp8mXf7
         e6efnjcqAHnxLpnEwNaFbnP4MusdpTYj1QOoG6jvtlqUl5QdDXp2DokwF/cE30RN5IIH
         7L0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
         :references:user-agent:mime-version;
        bh=Noo3UKIz6eixoV9cUm0tMx6veXOTEv85/CVG2wDCJ38=;
        b=V7+4xDIBgMQwYQcygevwGpPJrLvqTyTI/sSfV4GygpOhllaChyVAmjPOC6jExVgaR9
         8ijT2wp/WeqjpxopMJFaelWd8U/z9qHyR6HAji7tcIY2hIyoT7RP12kwco8LcxiTw4KK
         /rlrP2wtMYYSRssjoqNV+Ezlzg6UTlbFFEkDAOPLDMhsud51X115YeYcCKCr4PQUQh5z
         0f0XckxvLauYPm5AqT1D8t1bmWtqTiE8s+acDJJeoHoHdK7rzYqAkl2WOZaRt5bdRza1
         mU69SmZo2ovNWCz0aOe/9EY1Rn2uwld6Oz3UvX6enRpPkBPGCXXLSDkruHxI9RnlmwdT
         QYcQ==
X-Gm-Message-State: AOAM531CHt5zMi05CHU692iiOYEjsVoVCj+zgZ8TzbWjhBwIEK/DFecQ
        1rZzmVyHe4+5+XoWj0hIsk8=
X-Google-Smtp-Source: ABdhPJzBZz2+PKiWmK6INFr2pATT9j+pYM10EJr6sKSqPVyoiyX2wA2Goe6ItgZnnBD5ScGJJbQH2A==
X-Received: by 2002:a17:906:4cc7:: with SMTP id q7mr2599870ejt.437.1599640636594;
        Wed, 09 Sep 2020 01:37:16 -0700 (PDT)
Received: from felia ([2001:16b8:2d44:6000:6108:df55:7b8e:67d4])
        by smtp.gmail.com with ESMTPSA id g19sm1344680ejz.5.2020.09.09.01.37.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2020 01:37:15 -0700 (PDT)
From:   Lukas Bulwahn <lukas.bulwahn@gmail.com>
X-Google-Original-From: Lukas Bulwahn <lukas@gmail.com>
Date:   Wed, 9 Sep 2020 10:37:14 +0200 (CEST)
X-X-Sender: lukas@felia
To:     John Mathew <john.mathew@unikie.com>
cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        corbet@lwn.net, mingo@redhat.com, peterz@infradead.org,
        juri.lelli@redhat.com, vincent.guittot@linaro.org,
        dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com,
        mgorman@suse.de, bristot@redhat.com, tsbogend@alpha.franken.de,
        lukas.bulwahn@gmail.com, x86@kernel.org,
        linux-mips@vger.kernel.org, tglx@linutronix.de,
        willy@infradead.org, valentin.schneider@arm.com
Subject: Re: [RFC PATCH v8 0/3] Add scheduler overview documentation
In-Reply-To: <20200902162632.10271-1-john.mathew@unikie.com>
Message-ID: <alpine.DEB.2.21.2009090959530.5622@felia>
References: <20200902162632.10271-1-john.mathew@unikie.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



On Wed, 2 Sep 2020, John Mathew wrote:

> This patch series updates the scheduler documentation to add more topics
> wrt to scheduler overview. New sections are added to provide a brief
> overview of the kernel structs used by the scheduler, scheduler invocation,
> and context switch. Previous version of the patch was reviewed at:
> https://lore.kernel.org/lkml/20200527084421.4673-1-John.Mathew@unikie.com/
>

John, here is some first feedback to get the ball rolling:

I tried to apply your patches on v5.9-rc4, and I got those warnings:

Applying: docs: scheduler: Restructure scheduler documentation.
.git/rebase-apply/patch:30: new blank line at EOF.
+
.git/rebase-apply/patch:137: new blank line at EOF.
+
warning: 2 lines add whitespace errors.
Applying: docs: scheduler: Add scheduler overview documentation
.git/rebase-apply/patch:73: new blank line at EOF.
+
warning: 1 line adds whitespace errors.
Applying: docs: scheduler: Add introduction to scheduler context-switch
.git/rebase-apply/patch:153: new blank line at EOF.
+
.git/rebase-apply/patch:260: new blank line at EOF.
+
warning: 2 lines add whitespace errors.


You might want to look into this. I also checked that the patch also 
applies on linux-next, i.e., next-20200908; so, it does not clash in an 
obvious way with other changes at the moment.

I did run checkpatch.pl and it warned about:
WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?

No action required here. 


Documentation generation (make htmldocs) shows these two new warnings with 
your patches applied to v5.9-rc4:

  ./kernel/sched/core.c:17: WARNING: Definition list ends without a blank 
line; unexpected unindent.
  ./kernel/sched/core.c:21: WARNING: Unexpected indentation.


You might want to put those minor fixes on your remaining TODO list for 
this patchset as well.

I will continue to comment with more editorial points in the next hours 
and days, while proof-reading your additions to the documentation.


Lukas
