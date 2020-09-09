Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 76ADC262D31
	for <lists+linux-mips@lfdr.de>; Wed,  9 Sep 2020 12:31:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729129AbgIIKbf (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 9 Sep 2020 06:31:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57100 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729622AbgIIK23 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 9 Sep 2020 06:28:29 -0400
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com [IPv6:2a00:1450:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2CE75C061756;
        Wed,  9 Sep 2020 03:28:27 -0700 (PDT)
Received: by mail-ej1-x643.google.com with SMTP id i26so2719819ejb.12;
        Wed, 09 Sep 2020 03:28:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:date:to:cc:subject:in-reply-to:message-id:references
         :user-agent:mime-version;
        bh=5L0FYmrgLc/AeGlMxciewQL4fVagS62WHvA7C0Mha2U=;
        b=E8G3B3RxvtYLubvdBoAyQYrMASGo5lSSd9o6lL1PQY+8YqUa8et09R0wmnamuetkYE
         fMiH6pkm3pDMJ1+j5TROIfrzSEPpnnGGKfmtgWYDJ/Dmm/MZ59/U0LhRZ4APUKPE7Oi6
         VSdY4UhyUO5hQPOKd2Q86a+jM+Yo/8leB1c3MxDVxOfmLINUA0DdM65aaenVqLoSyH4p
         CNzEWMPk1WlcmWhxkglMo2jrzoHdYYbO2BKnZwvYyizfCBViVHTHyvbdeZO+5g4cIlAe
         Yz7IghsuDIcUrle9WLnJ5EKriRu0vVCIQGySsGsycETQhGxsDoV/9VhmYeJAO/rZANLZ
         I+OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
         :references:user-agent:mime-version;
        bh=5L0FYmrgLc/AeGlMxciewQL4fVagS62WHvA7C0Mha2U=;
        b=rPHzaHjoBn3wopjjE9JsF7Ygmry8J4DqUyuo64MQBncaHWRdIW4RXdLVB4ihVdtLnB
         alUt2TuaD64mFc8uo5hK7yMCcONuuHzZcOBIg49VYp2jRfnvbbwVX2FenIhiYlqdQrOa
         dHNXXIUZRRTAbV4ZBUEoFTsfGmu9TAvyK4IVZVmr4rn0W9IhidCEqMNYwNK/8cePquZk
         BoCFRZ7H6KLdAbiyB1CRxdQ8IUspR9kTRP75uXNsbd3bb8hE7HDqYjv7ihwY94tOeCjZ
         h9aPt2KVFKXmNB6QVML6whbz+Htmul+fDg4XRX8xC09fvuEeasOLpzB2kts4fCLjBdOx
         eGpw==
X-Gm-Message-State: AOAM5304nXR7UMO8H6xV/GzSVyNFCAidJu2tXn7ttsYOIYcjiNZ1wVUI
        ejaleWcmNchDbhaMvRq0Kyk=
X-Google-Smtp-Source: ABdhPJw0ydGLeroaQ4ovup4psjNpZukG2PQ9o2yOH3qe+YtDqrNa41WAoM9ok/DKKz4QeeguH05VwQ==
X-Received: by 2002:a17:906:e08f:: with SMTP id gh15mr2811259ejb.443.1599647305752;
        Wed, 09 Sep 2020 03:28:25 -0700 (PDT)
Received: from felia ([2001:16b8:2d44:6000:6108:df55:7b8e:67d4])
        by smtp.gmail.com with ESMTPSA id y21sm1690502eju.46.2020.09.09.03.28.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2020 03:28:25 -0700 (PDT)
From:   Lukas Bulwahn <lukas.bulwahn@gmail.com>
X-Google-Original-From: Lukas Bulwahn <lukas@gmail.com>
Date:   Wed, 9 Sep 2020 12:28:23 +0200 (CEST)
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
Subject: Re: [RFC PATCH v8 1/3] docs: scheduler: Restructure scheduler
 documentation.
In-Reply-To: <20200902162632.10271-2-john.mathew@unikie.com>
Message-ID: <alpine.DEB.2.21.2009091223470.5622@felia>
References: <20200902162632.10271-1-john.mathew@unikie.com> <20200902162632.10271-2-john.mathew@unikie.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



On Wed, 2 Sep 2020, John Mathew wrote:

> Add new sections to enable addition of new documentation on
> the scheduler. Existing documentation is moved under the related
> new sections. The sections are
>   - overview
>   - sched-features
>   - arch-specific.rst
>   - sched-debugging.rst
> 
> Suggested-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
> Signed-off-by: John Mathew <john.mathew@unikie.com>
> ---
>  Documentation/scheduler/arch-specific.rst   | 12 +++++++++
>  Documentation/scheduler/index.rst           | 30 +++++++++++----------
>  Documentation/scheduler/overview.rst        |  5 ++++
>  Documentation/scheduler/sched-debugging.rst | 14 ++++++++++
>  Documentation/scheduler/sched-features.rst  | 25 +++++++++++++++++
>  5 files changed, 72 insertions(+), 14 deletions(-)
>  create mode 100644 Documentation/scheduler/arch-specific.rst
>  create mode 100644 Documentation/scheduler/overview.rst
>  create mode 100644 Documentation/scheduler/sched-debugging.rst
>  create mode 100644 Documentation/scheduler/sched-features.rst
> 
> diff --git a/Documentation/scheduler/arch-specific.rst b/Documentation/scheduler/arch-specific.rst
> new file mode 100644
> index 000000000000..3e5af3a0695e
> --- /dev/null
> +++ b/Documentation/scheduler/arch-specific.rst
> @@ -0,0 +1,12 @@
> +.. SPDX-License-Identifier: GPL-2.0+
> +
> +Architecture Specific Scheduler Implementation Differences
> +==========================================================

That is a terribly long title, how about Architecture Specifics?

I am wondering if this should be on the toplevel documentation structure
directly under Linux Scheduler.

I think the x86 and MIPS context switch documentation could be placed
under Process context switching in a section Architecture Specifics.

> +
> +.. class:: toc-title
> +
> +	   Table of contents
> +
> +.. toctree::
> +   :maxdepth: 2
> +
> diff --git a/Documentation/scheduler/index.rst b/Documentation/scheduler/index.rst
> index 88900aabdbf7..6e88a070c503 100644
> --- a/Documentation/scheduler/index.rst
> +++ b/Documentation/scheduler/index.rst
> @@ -1,24 +1,26 @@
> +.. SPDX-License-Identifier: GPL-2.0+
> +
>  ===============
>  Linux Scheduler
>  ===============
>  
> -.. toctree::
> -    :maxdepth: 1
> +This documentation outlines the Linux kernel scheduler with its concepts,
> +details about the scheduler design and its data structures and architecture
> +specific implementation differences.
> +
>  
> +.. class:: toc-title
> +
> +    Table of contents
> +
> +.. toctree::
> +    :maxdepth: 2
>  
> -    completion
> -    sched-arch
> -    sched-bwc
> -    sched-deadline
> +    overview
>      sched-design-CFS
> -    sched-domains
> -    sched-capacity
> -    sched-energy
> -    sched-nice-design
> -    sched-rt-group
> -    sched-stats
> -
> -    text_files
> +    sched-features
> +    arch-specific
> +    sched-debugging
>  
>  .. only::  subproject and html
>  
> diff --git a/Documentation/scheduler/overview.rst b/Documentation/scheduler/overview.rst
> new file mode 100644
> index 000000000000..a1d2d26629eb
> --- /dev/null
> +++ b/Documentation/scheduler/overview.rst
> @@ -0,0 +1,5 @@
> +.. SPDX-License-Identifier: GPL-2.0+
> +
> +====================
> +Scheduler overview

s/Scheduler overview/Scheduler Overview/

for some more consistent capitalisation.

> +====================
> \ No newline at end of file

That could be the cause for the git am errors.

> diff --git a/Documentation/scheduler/sched-debugging.rst b/Documentation/scheduler/sched-debugging.rst
> new file mode 100644
> index 000000000000..e332069f99d6
> --- /dev/null
> +++ b/Documentation/scheduler/sched-debugging.rst
> @@ -0,0 +1,14 @@
> +.. SPDX-License-Identifier: GPL-2.0+
> +
> +Scheduler Debugging Interface
> +==============================
> +
> +.. class:: toc-title
> +
> +	   Table of contents
> +
> +.. toctree::
> +   :maxdepth: 2
> +
> +   sched-stats
> +   text_files
> diff --git a/Documentation/scheduler/sched-features.rst b/Documentation/scheduler/sched-features.rst
> new file mode 100644
> index 000000000000..8eb90e86e489
> --- /dev/null
> +++ b/Documentation/scheduler/sched-features.rst
> @@ -0,0 +1,25 @@
> +.. SPDX-License-Identifier: GPL-2.0+
> +
> +Scheduler Features
> +===================
> +
> +.. class:: toc-title
> +
> +	Table of contents
> +
> +.. toctree::
> +   :maxdepth: 1
> +
> +   completion
> +   sched-arch
> +   sched-bwc
> +   sched-deadline
> +   sched-domains
> +   sched-capacity
> +   sched-energy
> +   sched-nice-design
> +   sched-rt-group
> +   sched-stats
> +
> +   text_files

I guess it is fine to place everything here for now, but more clean-up 
would probably move those to the appropriate documentation structure, 
right?


> +
> -- 
> 2.17.1
> 
> 
