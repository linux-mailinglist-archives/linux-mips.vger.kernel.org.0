Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 365141AFB7D
	for <lists+linux-mips@lfdr.de>; Sun, 19 Apr 2020 16:46:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726439AbgDSOqn (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 19 Apr 2020 10:46:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56474 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726327AbgDSOqm (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 19 Apr 2020 10:46:42 -0400
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE336C061A0C;
        Sun, 19 Apr 2020 07:46:42 -0700 (PDT)
Received: by mail-pj1-x1043.google.com with SMTP id ms17so3292412pjb.0;
        Sun, 19 Apr 2020 07:46:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=4ANh3iy/mPqMIDICrcxwt25Ikadv1fNohryvS64Y5Ic=;
        b=fIqX2YOW3Z5Gg4Yo0893aOn1v6xaGRX6cKcQw5ykCjWv3rIZdewhJZVNkIhkw810bT
         50myZO6zUTtVcKYvzBdZxmrvMlMq+sHcrdTnv85cc+L6fr7JpQp/F/wD9o1m4CMlLI6a
         SiVxRGNVPrsfz9vGhyknCuLWb8Djr/DlP3CqZs3x6q9oIJFNQI7fpdltx1Ul9K60xc1T
         0YxTi9xZK0kRvRnbPt/1+QDCgKSDtLzNq2sZzXEDMpw/0h82lBgpYnl/S+8JbmNzuVOq
         fhNLI8irMqPZfr8mxt9WhH3xNg08DOOSAlvQAv+1QXaso/V4FzjMLuGn0LrT6hJH7LYF
         U5nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=4ANh3iy/mPqMIDICrcxwt25Ikadv1fNohryvS64Y5Ic=;
        b=f/8YZANAbI24W8uPn9J2GfRpx1tXOPO1VTQeHvAFm0eevkgkSfveJmTwjH27pVyhWm
         mJM1O781ggI6s6bhU1dApO2cVr81TYaQSexZi7BxGwuR0QH9Bp/c5gS9AaR29uvXhGOV
         1w9By2LFkSCv2s2PcIstKFkHjVf7xISzIf2hh/cYYcbApoKTgrllIuJyjzw0aDrYMqYV
         CCbQkuxhnSZyije0HOI6eUWOtVn65fxp9JkEhCjWFNEigvJtZ9xBc1NhX86meJ7ogl/Q
         SpnBeHh/O6mLgVjDHO+qiXy4c1HClVHobD4yAuvQ/YrryKf4OVU9xlcw3drAzdp2Ix2d
         0khg==
X-Gm-Message-State: AGi0PuZ23iprtBfr2fg8l+G/8RnxX9n9WXl9MUEWwNAgJLDZCuS7bJW1
        0RNI6mZzvIJ6Qsi4mPmuvKs=
X-Google-Smtp-Source: APiQypI6PFLvrwCcVGIStbSxL8W1ovNeN6eQTo8pk3ibch/2uXo1kxA5JD5UNB9cEJQ5nDRlskMQeQ==
X-Received: by 2002:a17:90a:c786:: with SMTP id gn6mr15790109pjb.147.1587307602531;
        Sun, 19 Apr 2020 07:46:42 -0700 (PDT)
Received: from localhost ([49.205.221.114])
        by smtp.gmail.com with ESMTPSA id i128sm15713738pfc.149.2020.04.19.07.46.40
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 19 Apr 2020 07:46:41 -0700 (PDT)
Date:   Sun, 19 Apr 2020 20:16:38 +0530
From:   afzal mohammed <afzal.mohd.ma@gmail.com>
To:     Thomas Bogendoerfer <tbogendoerfer@suse.de>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>
Cc:     linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org
Subject: Re: [PATCH 0/3] Remove setup_percpu_irq() & remove_percpu_irq
Message-ID: <20200419144638.ysghqzklebkeer4z@afzalpc>
References: <cover.1586434781.git.afzal.mohd.ma@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1586434781.git.afzal.mohd.ma@gmail.com>
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Thomas Gleixner,

On Sat, Apr 11, 2020 at 09:34:07PM +0530, afzal mohammed wrote:

> While doing the removal of setup_irq(), it was observed that
> setup_percpu_irq() also can be removed similarly by replacing it w/
> request_percpu_irq(), which does allocate memory. In the initial
> setup_irq() removal cover letters [1], it was mentioned that
> setup_percpu_irq() is untouched.
> 
> After removing setup_irq(), it does not look good to let live
> setup_percpu_irq(), especially since it being a low hanging fruit. Hence
> replace setup_percpu_irq() by it's allocator equivalent.
> request_percpu_irq() cannot be used since all the users need to pass
> IRQF_TIMER flag, which it would not allow. Thus it's variant,
> __request_percpu_irq() is used.
> 
> In addition to removing setup_percpu_irq() definition,
> remove_percpu_irq(), unused, is also removed.

Do you feel that this series adds value ?, if not, i will abandon this
series.

Thanks for your guidance w.r.t setup_irq() removal.

Regards
afzal

