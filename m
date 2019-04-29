Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6817BE611
	for <lists+linux-mips@lfdr.de>; Mon, 29 Apr 2019 17:21:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728487AbfD2PU5 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 29 Apr 2019 11:20:57 -0400
Received: from mail-ed1-f65.google.com ([209.85.208.65]:36360 "EHLO
        mail-ed1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728448AbfD2PU5 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 29 Apr 2019 11:20:57 -0400
Received: by mail-ed1-f65.google.com with SMTP id a8so7426225edx.3;
        Mon, 29 Apr 2019 08:20:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:references:date:in-reply-to:message-id
         :user-agent:mime-version;
        bh=mcdMJtYTzbrFusKEz05dVZkKSln24Oc8rmFJOLHlFyc=;
        b=NMtm7loEpc1LtkiaskUlbbeKkI7Yur5IYVgFyYL/NUTYqRo00L+1M56sDV1wd61Eic
         074Hciwdzeq59lUY+emKFAFZuwf6s0YdW71qd918YF2wGclyc0PYWeqExnpOiAhdtCU+
         CugXqkaoE30DMKVWaPIwatHrP4MHEtOIK+xDDsmltZh5gMFXbPuH28VGT0LKdDVx7Kci
         NM9fmLAlxt3fKfmamYW2yxGr9RbaioIm25eCrQYGbaQLBSlnmiE5E79RZy2SAIQzJ09y
         /8xviY57bx916zBUV5eOMAwXesFB85WVdwsbKrEe802pzwew/ZbsAd943pi/DNCJaLOo
         Cx8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:references:date
         :in-reply-to:message-id:user-agent:mime-version;
        bh=mcdMJtYTzbrFusKEz05dVZkKSln24Oc8rmFJOLHlFyc=;
        b=auWr826bo+F49NG8mvRm5PjeitD6ZRhHMKDNLTs+aVHfh9VbOIjCj6p4h/u8/dt38W
         r+q9HJOJ4dBptNAGP89Xqwjvq2H5bzb4gb2p6AnIG3hPeH5tdqQxrA1vCRmyD/nmnp+q
         hg3MBwSZ5eYpRK3lb6+DLZEAHukLrGK7G3Ila2LpvhRMsJ35sX8Vg10IVtOdNIG2V+oD
         hxiAaj3Lf/oath0WWAEwssd3yAooE0aGFlLacqk4iObW9lEYcz1wgw+A7EOaYmXA45go
         2yf9yucRoYIvURIZY66gd454EGjumkDmbcx4S/unWA4oYq04rkv4xPzb4/DI4Cbw9O7o
         BL2w==
X-Gm-Message-State: APjAAAXHndWuKKRB0jBOpXzpIOMM+A+V18rxITQU6dwsS5dQ2i0bfQKI
        UPpacuep4kGr6gHkQwoo6vs=
X-Google-Smtp-Source: APXvYqweysPzcxqvyw2tG1BMJOB/LdC5EufVXTrbhZSqeXGXptVb/Oa4KlfV9hkDZfTJPecfQ5Owcg==
X-Received: by 2002:a17:906:e119:: with SMTP id gj25mr7661484ejb.7.1556551255068;
        Mon, 29 Apr 2019 08:20:55 -0700 (PDT)
Received: from dell.be.48ers.dk (d51A5BC31.access.telenet.be. [81.165.188.49])
        by smtp.gmail.com with ESMTPSA id o9sm5761786edh.95.2019.04.29.08.20.54
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 29 Apr 2019 08:20:54 -0700 (PDT)
Received: from peko by dell.be.48ers.dk with local (Exim 4.89)
        (envelope-from <peter@korsgaard.com>)
        id 1hL85N-0000ep-Qh; Mon, 29 Apr 2019 17:20:53 +0200
From:   Peter Korsgaard <peter@korsgaard.com>
To:     "Enrico Weigelt\, metux IT consult" <info@metux.net>
Cc:     linux-kernel@vger.kernel.org, lorenzo.pieralisi@arm.com,
        linux-ia64@vger.kernel.org, linux-serial@vger.kernel.org,
        andrew@aj.id.au, gregkh@linuxfoundation.org, sudeep.holla@arm.com,
        liviu.dudau@arm.com, linux-mips@vger.kernel.org, vz@mleia.com,
        linux@prisktech.co.nz, sparclinux@vger.kernel.org,
        khilman@baylibre.com, macro@linux-mips.org,
        slemieux.tyco@gmail.com, matthias.bgg@gmail.com, jacmet@sunsite.dk,
        linux-amlogic@lists.infradead.org,
        andriy.shevchenko@linux.intel.com, linuxppc-dev@lists.ozlabs.org,
        davem@davemloft.net
Subject: Re: [PATCH 14/41] drivers: tty: serial: uartlite: remove unnecessary braces
References: <1556369542-13247-1-git-send-email-info@metux.net>
        <1556369542-13247-15-git-send-email-info@metux.net>
Date:   Mon, 29 Apr 2019 17:20:53 +0200
In-Reply-To: <1556369542-13247-15-git-send-email-info@metux.net> (Enrico
        Weigelt's message of "Sat, 27 Apr 2019 14:51:55 +0200")
Message-ID: <87imuwrg6i.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.5 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

>>>>> "Enrico" == Enrico Weigelt, metux IT consult <info@metux.net> writes:

 > checkpatch complains:
 >     WARNING: braces {} are not necessary for any arm of this statement
 >     #489: FILE: drivers/tty/serial/uartlite.c:489:
 >     +	if (oops_in_progress) {
 >     [...]
 >     +	} else
 >     [...]

 > Signed-off-by: Enrico Weigelt <info@metux.net>

Acked-by: Peter Korsgaard <peter@korsgaard.com>

-- 
Bye, Peter Korsgaard
