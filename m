Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5A6FB3FC002
	for <lists+linux-mips@lfdr.de>; Tue, 31 Aug 2021 02:43:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234153AbhHaAeq (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 30 Aug 2021 20:34:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47400 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230523AbhHaAep (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 30 Aug 2021 20:34:45 -0400
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 76F6EC06175F
        for <linux-mips@vger.kernel.org>; Mon, 30 Aug 2021 17:33:51 -0700 (PDT)
Received: by mail-pj1-x1032.google.com with SMTP id f11-20020a17090aa78b00b0018e98a7cddaso1161257pjq.4
        for <linux-mips@vger.kernel.org>; Mon, 30 Aug 2021 17:33:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=TjFdVibCziMMV625QJ8En+pQePJGwxqOLzHHo+cR/2g=;
        b=AzDcWKGtdHyMnoIEjzFPFQjRSRfN6cZcyUfqyg+1RFft/sQblgaz4y7UB0acXhUsAk
         aYq77Xwd7EMjSfEApWR3a558fJLQOEbjXYD1SI5rTv8NJMwK07Xba20kndQ9K5z7nQNv
         VqF6GPhvubvT3lLK/TsJYcG7uj5cuYcL5eVI8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=TjFdVibCziMMV625QJ8En+pQePJGwxqOLzHHo+cR/2g=;
        b=qvG2iabS9CnJpnVlRyqZBvAW5SldgF2kRRL9sGSQb7ZWUfvTtDluPHsnvJuryXnns3
         WcgW4nbUawKRgFQPhXfCmQ3zrEbDrqsVlGgl29SGdhoTMha0e/pTx90Xw8oPh0In0JGt
         sOKQLMPBgg46Od6CK75Ob422RBQEsu4SrtxUG/CgZu7IxrfsxiuViGPQmkIvx+T0zgq6
         rmawR28BW4THcyRRPtJKUQ8qIxUC1nzRg/1j3RbNU4NrpB3UZycTn3JdSrDjBsGFW+/+
         s7mRSX+Oj5GvA8yfhzkq0QdxWUs+hf1xyqEjh2c0HBhU0YTrAcQ3QEl4eoKc82Ya0WSx
         GgZg==
X-Gm-Message-State: AOAM531aMYSwQXyz8TDy5RbI3XsRBrPaZ2nI4gJ0H+3zMeTTR9yfeMB1
        F2gYLBM4LPDYnThSlPYSTI3uDA==
X-Google-Smtp-Source: ABdhPJxdbxW4ryHv5bhuf8dsnrqkWswjsDidSV0lyn6xogTwXPWUAw0uITGdywWoWH5lbvCpqEzDjw==
X-Received: by 2002:a17:90a:bc47:: with SMTP id t7mr2025742pjv.19.1630370030908;
        Mon, 30 Aug 2021 17:33:50 -0700 (PDT)
Received: from google.com ([2409:10:2e40:5100:69ed:b45b:ceb5:e18b])
        by smtp.gmail.com with ESMTPSA id q12sm15915318pfj.153.2021.08.30.17.33.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Aug 2021 17:33:50 -0700 (PDT)
Date:   Tue, 31 Aug 2021 09:33:36 +0900
From:   Sergey Senozhatsky <senozhatsky@chromium.org>
To:     Petr Mladek <pmladek@suse.com>
Cc:     John Ogness <john.ogness@linutronix.de>,
        Sergey Senozhatsky <senozhatsky@chromium.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        linux-kernel@vger.kernel.org,
        Andrew Morton <akpm@linux-foundation.org>,
        Peter Zijlstra <peterz@infradead.org>,
        "Paul E. McKenney" <paulmck@kernel.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
        Jason Wessel <jason.wessel@windriver.com>,
        Daniel Thompson <daniel.thompson@linaro.org>,
        Douglas Anderson <dianders@chromium.org>,
        Srikar Dronamraju <srikar@linux.vnet.ibm.com>,
        "Gautham R. Shenoy" <ego@linux.vnet.ibm.com>,
        Chengyang Fan <cy.fan@huawei.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Bhaskar Chowdhury <unixbhaskar@gmail.com>,
        Nicholas Piggin <npiggin@gmail.com>,
        =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        linuxppc-dev@lists.ozlabs.org,
        kgdb-bugreport@lists.sourceforge.net,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
        Vitor Massaru Iha <vitor@massaru.org>,
        Sedat Dilek <sedat.dilek@gmail.com>,
        Changbin Du <changbin.du@intel.com>,
        Sumit Garg <sumit.garg@linaro.org>,
        Cengiz Can <cengiz@kernel.wtf>,
        Jiri Slaby <jirislaby@kernel.org>,
        Paul Cercueil <paul@crapouillou.net>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Andrew Jeffery <andrew@aj.id.au>,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        kuldip dwivedi <kuldip.dwivedi@puresoftware.com>,
        Wang Qing <wangqing@vivo.com>, Andrij Abyzov <aabyzov@slb.com>,
        Johan Hovold <johan@kernel.org>,
        Eddie Huang <eddie.huang@mediatek.com>,
        Claire Chang <tientzu@chromium.org>,
        Hsin-Yi Wang <hsinyi@chromium.org>,
        Zhang Qilong <zhangqilong3@huawei.com>,
        "Maciej W. Rozycki" <macro@orcam.me.uk>,
        Guenter Roeck <linux@roeck-us.net>,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        Al Cooper <alcooperx@gmail.com>, linux-serial@vger.kernel.org,
        linux-mips@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org
Subject: Re: [PATCH printk v1 00/10] printk: introduce atomic consoles and
 sync mode
Message-ID: <YS144PMiCJnmoKE4@google.com>
References: <20210803131301.5588-1-john.ogness@linutronix.de>
 <YQwHwT2wYM1dJfVk@alley>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YQwHwT2wYM1dJfVk@alley>
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On (21/08/05 17:47), Petr Mladek wrote:
[..]
> 3. After introducing console kthread(s):
> 
> 	int printk(...)
> 	{
> 		vprintk_store();
> 		wake_consoles_via_irqwork();
> 	}
> 
> 	+ in panic:
> 
> 	    + with atomic console like after this patchset?
> 	    + without atomic consoles?
> 
> 	+ during early boot?

I guess I'd also add netconsole to the list.
