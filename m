Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9B28DEE7A1
	for <lists+linux-mips@lfdr.de>; Mon,  4 Nov 2019 19:47:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728800AbfKDSrz (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 4 Nov 2019 13:47:55 -0500
Received: from mail-pl1-f193.google.com ([209.85.214.193]:37432 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728766AbfKDSry (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 4 Nov 2019 13:47:54 -0500
Received: by mail-pl1-f193.google.com with SMTP id p13so8011075pll.4
        for <linux-mips@vger.kernel.org>; Mon, 04 Nov 2019 10:47:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:from:to:cc:cc:cc:subject
         :references:in-reply-to;
        bh=UHuFjpI0KEeOc2U650+9PRUfkNCjcdtU8/U3DUHczFo=;
        b=ZO5Pn0K8jJ9QnA7Vus7O2VFd5WfuH7/W6G4DyJCnmFi/p27roY4me6/yGDnXVBuAQh
         SF3wfqTC/3nSwT48NiZVmnPjOM1OpD+dqqSiNKTP8oFth9ekGtWCwqKIXbOMuOLI0PDk
         tBCtDvnEcCuUeFDxfcfvK97OvdRZctNYvO8HbIwJC6Sf8LxA7SU8orQxsxFeOknp0cuL
         Vup1nq+3ihBQwHO9/uZLZZN7l7qfOQ5dkx98a+Ttq5kVVFgHSBcuavXw4WCEvPYDcIru
         RKBzi8Zb6H3EEyvm7YSf71aBG2ca8MwpT+Rd7+FNDQuDHH6/hCh5UKnCwTAqtYUSdK9A
         j1Yg==
X-Gm-Message-State: APjAAAWXhupYVcY7clhqPNUTAop1IaW43xxTBBVu8hSWeUINiazEZHWM
        dWyFh5Ex85MDKW32o5PVUn8=
X-Google-Smtp-Source: APXvYqz+b6NJJPZMbk4itJjgVPJBuT0NP8ea027FqR8MweTRNPiZ/lbT2/9A22yQD+SKVWv0bcgaOA==
X-Received: by 2002:a17:902:8bc2:: with SMTP id r2mr29215626plo.36.1572893273673;
        Mon, 04 Nov 2019 10:47:53 -0800 (PST)
Received: from localhost (MIPS-TECHNO.ear1.SanJose1.Level3.net. [4.15.122.74])
        by smtp.gmail.com with ESMTPSA id y4sm789222pgy.27.2019.11.04.10.47.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Nov 2019 10:47:52 -0800 (PST)
Message-ID: <5dc07258.1c69fb81.d6eef.303c@mx.google.com>
Date:   Mon, 04 Nov 2019 10:47:52 -0800
From:   Paul Burton <paulburton@kernel.org>
To:     Florian Fainelli <f.fainelli@gmail.com>
CC:     linux-mips@linux-mips.org
CC:     bcm-kernel-feedback-list@broadcom.com, cernekee@gmail.com,
        Florian Fainelli <f.fainelli@gmail.com>
CC:     linux-mips@vger.kernel.org
Subject: Re: [PATCH] MAINTAINERS: Remove Kevin as maintainer of BMIPS generic  platforms
References:  <20191018171651.12582-1-f.fainelli@gmail.com>
In-Reply-To:  <20191018171651.12582-1-f.fainelli@gmail.com>
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hello,

Florian Fainelli wrote:
> The last time Kevin did a review was sometime around 2014,
> since then, he has not been active for the BMIPS generic platform
> changes.
> 
> Following the position of other maintainers and Harald Welte's position
> here:
> 
> [1] http://laforge.gnumonks.org/blog/20180307-mchardy-gpl/
> 
> remove him from the list of maintainers.

Applied to mips-fixes.

> commit f6929c92e283
> https://git.kernel.org/mips/c/f6929c92e283
> 
> Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
> [paulburton@kernel.org:
>   Drop the non-technical commit message content; Kevin's absence from
>   the role is ample reasoning for this change.]
> Signed-off-by: Paul Burton <paulburton@kernel.org>

Thanks,
    Paul

[ This message was auto-generated; if you believe anything is incorrect
  then please email paulburton@kernel.org to report it. ]
