Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 569601859AE
	for <lists+linux-mips@lfdr.de>; Sun, 15 Mar 2020 04:32:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726738AbgCODcO (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 14 Mar 2020 23:32:14 -0400
Received: from mail-qv1-f65.google.com ([209.85.219.65]:39447 "EHLO
        mail-qv1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726643AbgCODcO (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 14 Mar 2020 23:32:14 -0400
Received: by mail-qv1-f65.google.com with SMTP id v38so2933623qvf.6;
        Sat, 14 Mar 2020 20:32:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=xbsrrOUuOCaew5V0EWs0+B+Jp0347VeucEvJJNOWq4g=;
        b=Kie63I7dqrJ+CeU89vuO7pifO87HKB1RFY03QprPlryaQu20cucHqdDr/NbbN72R8s
         Kkmvk5CRC3phlToat4QVCDWjgXXwgvzE0UTFdnza6TvBdPjp4i70j/RMi4Zk2W16/TOO
         RrHX+5KF9kSSPz4vg5YB0DL+DIu1tE4/dgwNbhQVSUjdZSuz5e8nVZtodHQf+ExELFBc
         xbbWEwa/8b1QyWp2r2NGH8RnsTwH/1dRv/Cybdzfdq0rjeEtin+4/YnwQlmGCzAAP+9v
         JZIEs4tFktLsEnjHWRMTSvz6uVCekL3ib5cJzYddrnsOG92x0kS5JAFd6t/ep08CfkGD
         s4+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=xbsrrOUuOCaew5V0EWs0+B+Jp0347VeucEvJJNOWq4g=;
        b=UZ8BdBox6MPgSziGZZqnjoJlRVIn7Hg6irmEkk11I74ZE5jMIuST4f5Xacml3B93xx
         mdHyHa1za09X2QeYTe/j+BbdyPDErSs1y8DHckFFjHNCgfy3rNhDEOlARhfvsrYpS2B3
         lH1j7CtSSQbwYfBYB0ovTTYpU2IfastDURem0hlNnC1uzyz+0Jmwk9YaBmbE4g5egzkH
         O+skMAHpy2FZFqEjFE5Lm1G7UsfFcbFKj4WGUKTLxpoXFgI2NY+ox2ENJIsVGsebAB0R
         k4qagwTxx30jstql0GXvaxtnV4+Mx2hCobsnMDvsF/oIBlnz0YCf2Tun96svDkxvf2KM
         pQ/w==
X-Gm-Message-State: ANhLgQ2n+rqUKgR9sfLbUK14QNToBQexcVXKEIg7k4o1b7bx0+lW9Yes
        8X+Z+H+2Qa0fEzUIc44NEa7h9cnm4kU=
X-Google-Smtp-Source: ADFU+vuNd6Tp1XUCLCGd+43lz8+qZo3gUwgEb1CVKJs42QFxX571L6En50gRptDRWtjpX1EtuWwuSQ==
X-Received: by 2002:a17:902:9308:: with SMTP id bc8mr17473083plb.268.1584168950505;
        Fri, 13 Mar 2020 23:55:50 -0700 (PDT)
Received: from localhost ([106.51.232.35])
        by smtp.gmail.com with ESMTPSA id y18sm734349pge.73.2020.03.13.23.55.49
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 13 Mar 2020 23:55:49 -0700 (PDT)
Date:   Sat, 14 Mar 2020 12:25:48 +0530
From:   afzal mohammed <afzal.mohd.ma@gmail.com>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     Nathan Chancellor <natechancellor@gmail.com>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paulburton@kernel.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        bcm-kernel-feedback-list@broadcom.com,
        "Maciej W. Rozycki" <macro@linux-mips.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Keguang Zhang <keguang.zhang@gmail.com>,
        Huacai Chen <chenhc@lemote.com>,
        John Crispin <john@phrozen.org>
Subject: Re: [PATCH v4] MIPS: Replace setup_irq() by request_irq()
Message-ID: <20200314065548.GB5285@afzalpc>
References: <20200304203144.GA4323@alpha.franken.de>
 <20200305115759.3186-1-afzal.mohd.ma@gmail.com>
 <20200311053126.GA48442@ubuntu-m2-xlarge-x86>
 <20200311090308.GA5060@afzalpc>
 <20200311104217.GA10615@alpha.franken.de>
 <20200311131210.GA5115@afzalpc>
 <20200311160307.GA15464@alpha.franken.de>
 <20200311163249.GA4984@afzalpc>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200311163249.GA4984@afzalpc>
User-Agent: Mutt/1.9.3 (2018-01-21)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi,

On Wed, Mar 11, 2020 at 10:02:49PM +0530, afzal mohammed wrote:
> On Wed, Mar 11, 2020 at 05:03:07PM +0100, Thomas Bogendoerfer wrote:

> > in your patch. How can we make sure they are unique enough for the use
> > case ? I guess using handler as dev_id does a better job here.
> 
> There was one prior similar usage using string pointers, another way i
> have seen is using irq no. itself, 

Huh, that was a total nonsense statement from me, considering the
expectation of a unique dev_id, i don't know what i was thinking at
that time, though you mentioned about uniqueness.

Regards
afzal
