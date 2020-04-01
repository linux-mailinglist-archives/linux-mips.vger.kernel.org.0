Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C08EF19AB85
	for <lists+linux-mips@lfdr.de>; Wed,  1 Apr 2020 14:20:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727661AbgDAMUW (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 1 Apr 2020 08:20:22 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:33454 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726804AbgDAMUV (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 1 Apr 2020 08:20:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1585743620;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=WDTPFa8ZURJktfLOzCbfsD4S80g+FQC7hULNIYlAu7Y=;
        b=HZOqHMozCbWpkdd/KjVIKR4DlsITlLsJOPSQbPbvlqZX+gko4UO74zyyJGy8S79XwhiBa5
        RBhsyfuQ5Uc5Ophbl7yMPVQwgZ0Lv82YJu322z/6kkFtChhSo+NrLF2IaeNCTiHqtd9WO1
        W/3sJBZUNFYrqSxbFwBwIAxWxTNilzo=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-282-Ep7S1TqMNZaGd_eUHZQPAQ-1; Wed, 01 Apr 2020 08:20:18 -0400
X-MC-Unique: Ep7S1TqMNZaGd_eUHZQPAQ-1
Received: by mail-wr1-f72.google.com with SMTP id u16so11518889wrp.14
        for <linux-mips@vger.kernel.org>; Wed, 01 Apr 2020 05:20:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=WDTPFa8ZURJktfLOzCbfsD4S80g+FQC7hULNIYlAu7Y=;
        b=iG5UxuFG8gIboglgD2KV2l6NJo8LP8CaSss3TRxUqadX6Q1MpQdfm5VoDBCApSTz7b
         Nsg0XxW5wuB2k6f1VP2JDDEX6gvDitaYyrJdjKjJ5LqXK5f/erGi6eCG86bDy+tK01JF
         De3jrJ+EPtHCQm736xxHvf4S9/2g3pHBgW+9rxYnLdQ2wB+qYYCft1Iq4RCYfDjP90dg
         7jvBEPf/awZTvi/7tzpebOV6Hlnu54wChID/+8zSPcnKA9RDPFRjtyXNsuR9VbVEpoks
         LyVvOkvIvlvmVKjDP/5gg7jqBTPozfs+0gSPzlE2k4fqdy8kbKIcuyCOmSce1RwPkDrD
         H4Zw==
X-Gm-Message-State: AGi0PuYP55/mE3EKdOa7Burise2rM2EZiRHVE7glwkw/49GURrGNkdJe
        HqPZP7JF8T5+goLmLOo7TgQtLinag4ek6iPDANnN9tJSppzgqbajjrHQQMgclumRxF3YBtrKtCb
        mc38jJsWt8mL68iKrHW5nEQ==
X-Received: by 2002:a1c:7216:: with SMTP id n22mr3957781wmc.41.1585743617454;
        Wed, 01 Apr 2020 05:20:17 -0700 (PDT)
X-Google-Smtp-Source: APiQypJGm9VynkGDD62kpREjFTDmdSlFXsNNAMFtPN11ojKIAP6F3bbB/QcM2CPWq2x/1zd9n90kRw==
X-Received: by 2002:a1c:7216:: with SMTP id n22mr3957763wmc.41.1585743617216;
        Wed, 01 Apr 2020 05:20:17 -0700 (PDT)
Received: from localhost.localdomain ([151.29.194.179])
        by smtp.gmail.com with ESMTPSA id s15sm2646131wrt.16.2020.04.01.05.20.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2020 05:20:16 -0700 (PDT)
Date:   Wed, 1 Apr 2020 14:20:14 +0200
From:   Juri Lelli <juri.lelli@redhat.com>
To:     John Mathew <john.mathew@unikie.com>
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        corbet@lwn.net, mingo@redhat.com, peterz@infradead.org,
        vincent.guittot@linaro.org, dietmar.eggemann@arm.com,
        rostedt@goodmis.org, bsegall@google.com, mgorman@suse.de,
        bristot@redhat.com, tsbogend@alpha.franken.de,
        lukas.bulwahn@gmail.com, x86@kernel.org,
        linux-mips@vger.kernel.org, tglx@linutronix.de,
        mostafa.chamanara@basemark.com
Subject: Re: [RFC PATCH 2/3] docs: scheduler: Add scheduler overview
 documentation
Message-ID: <20200401122014.GW14300@localhost.localdomain>
References: <20200401100029.1445-1-john.mathew@unikie.com>
 <20200401100029.1445-3-john.mathew@unikie.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200401100029.1445-3-john.mathew@unikie.com>
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi,

On 01/04/20 13:00, John Mathew wrote:
> Add documentation for
>  -scheduler overview
>  -scheduler state transtion
>  -CFS overview
>  -CFS data structs
> 
> Add rst for scheduler APIs and modify sched/core.c
> to add kernel-doc comments.
> 
> Suggested-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
> Co-developed-by: Mostafa Chamanara <mostafa.chamanara@basemark.com>
> Signed-off-by: Mostafa Chamanara <mostafa.chamanara@basemark.com>
> Signed-off-by: John Mathew <john.mathew@unikie.com>
> ---

[...]

> +Kernel forwards the tasks to each class based on the scheduling policy assigned
> +to each task. Tasks assigned with SCHED_NORMAL, SCHED_IDLE and SCHED_BATCH
> +go to fair_sched_class and tasks assigned with SCHED_RR and SCHED_FIFO go to
> +rt_sched_class

I think you also need to mention that SCHED_DEADLINE goes to
dl_sched_class.

[...]

> +*poicy:* Value for scheduling policy. The possible values are:
> +
> +* SCHED_NORMAL: Regular tasks use this policy.
> +
> +* SCHED_BATCH:  Tasks which need to run longer  without pre-emption use this
> +  policy. Suitable for batch jobs.
> +* SCHED_IDLE: Policy used by background tasks.
> +
> +* SCHED_FIFO & SCHED_RR: These policies for real time tasks. Handled by real
> +  time scheduler.

Here as well. Maybe add also a pointer to related documentation?

Documentation/scheduler/sched-deadline.txt

Thanks,

Juri

