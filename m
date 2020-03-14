Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6632D1859DD
	for <lists+linux-mips@lfdr.de>; Sun, 15 Mar 2020 04:51:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726653AbgCODvi (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 14 Mar 2020 23:51:38 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:32953 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726668AbgCODvi (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 14 Mar 2020 23:51:38 -0400
Received: by mail-pf1-f193.google.com with SMTP id n7so7798645pfn.0;
        Sat, 14 Mar 2020 20:51:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=Uim4AzYBCm6V2z3QF09x5PPcRE01qrMuLypTdVFHimA=;
        b=jE9cFqMIPYofiNcH+xERYgJ9saPt+Kj9OIakPPW3wROVmtHc2kEDMOO04aTSlsYSEm
         AhJstHD5b6Y7Ka9JrfO/E/kIThMLUYmVc3DvSzHvFFsAnVPZbe/ug+yhHMJk2+DgRA8V
         a9TzqqNb3H4w7M4EgiU+rUGvAtVUXTXr3r7+/2sqgNTCvKwLZ96PyfvDjWYqprG5+fH+
         U19nzB0FSdOwDpDlDXi5bGp2k+i8bwk6k0woWuOPQcf7pEanHQyxMkcAT8ELObqiuTsL
         fKSvK/EYwUN1H3eS6ez+aSRZA7ZO+8LphankfmBcTWpWDePWZUtI51qE/iIqcW0uIbao
         zJgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Uim4AzYBCm6V2z3QF09x5PPcRE01qrMuLypTdVFHimA=;
        b=hiD5eVW10hiXZpLdyi4lYwiorm+HAzm+gMFpFn4gSUPqZgwU1pLF5JmIqWdKZpooQY
         tcfYp7bqVZrFh7ofI2gpYWVqI+aUg3Mi4qvzHdGXqrQ0vy7RXEZXDaF1HuwD5SaDoaZi
         wazQXN7nz48pDcbZre6z20tIEe/06Y2HkCRu1jKM++8a6YlnAQZ5CWJBsMjub6kgvYWQ
         yzA7vwqLWjTFvpwvszVrr3esJBiB74nmmXSfaPNWs/k51Y17P2xsGxD+tHgY5ZmSiA+7
         WKl3rixRJl9Oh+TMc2BuJOUCvR1GUlddkm/V9pLBFQROCfL0yosWCWNSJNdFrxBFfNxq
         f3HA==
X-Gm-Message-State: ANhLgQ3Iw95L1lLdvXMq7h1oyB3/QsfC9m0w01kdVBNJbcRBvuh/1uL6
        AF59WqCDSc/7N0WSWrxNdYHoiem/MkM=
X-Google-Smtp-Source: ADFU+vsAFNYY+qMaVOBxLw+qtltM33BNN6phFUmxCHU630aJrU4CWVFiR6zHzz/Y0D1cSUuGio/2wQ==
X-Received: by 2002:a63:6101:: with SMTP id v1mr17235961pgb.318.1584186170624;
        Sat, 14 Mar 2020 04:42:50 -0700 (PDT)
Received: from localhost ([106.51.232.35])
        by smtp.gmail.com with ESMTPSA id y131sm17983125pfg.25.2020.03.14.04.42.49
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 14 Mar 2020 04:42:49 -0700 (PDT)
Date:   Sat, 14 Mar 2020 17:12:47 +0530
From:   afzal mohammed <afzal.mohd.ma@gmail.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paulburton@kernel.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        bcm-kernel-feedback-list@broadcom.com,
        "Maciej W. Rozycki" <macro@linux-mips.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Keguang Zhang <keguang.zhang@gmail.com>,
        Huacai Chen <chenhc@lemote.com>,
        John Crispin <john@phrozen.org>,
        Nathan Chancellor <natechancellor@gmail.com>
Subject: Re: [PATCH v4] MIPS: Replace setup_irq() by request_irq()
Message-ID: <20200314114247.GA5577@afzalpc>
References: <20200304203144.GA4323@alpha.franken.de>
 <20200305115759.3186-1-afzal.mohd.ma@gmail.com>
 <20200313164751.GA30134@roeck-us.net>
 <20200314010744.GA5494@afzalpc>
 <204ac322-4214-fc83-e0b9-14473f855b0a@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <204ac322-4214-fc83-e0b9-14473f855b0a@roeck-us.net>
User-Agent: Mutt/1.9.3 (2018-01-21)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Sat, Mar 14, 2020 at 03:28:53AM -0700, Guenter Roeck wrote:
> On 3/13/20 6:07 PM, afzal mohammed wrote:

> > Can you please apply,
> > 
> > https://lkml.kernel.org/r/20200311152751.GA5044@afzalpc,
> > 
> > on top of this patch & see if it fixes the issue.

> I have not tested all configurations, but a quick check suggests
> that it does indeed fix the problem.

Thanks Guenter for checking,

i have sent a newer version [1] of that patch based on the feedback
from Thomas.

REgards
afzal

[1] https://lkml.kernel.org/r/20200314081312.GA4948@afzalpc
