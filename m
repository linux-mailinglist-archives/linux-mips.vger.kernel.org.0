Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 75691130D7E
	for <lists+linux-mips@lfdr.de>; Mon,  6 Jan 2020 07:25:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726818AbgAFGZ1 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 6 Jan 2020 01:25:27 -0500
Received: from mail-lf1-f48.google.com ([209.85.167.48]:40246 "EHLO
        mail-lf1-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726770AbgAFGZ0 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 6 Jan 2020 01:25:26 -0500
Received: by mail-lf1-f48.google.com with SMTP id i23so35660508lfo.7
        for <linux-mips@vger.kernel.org>; Sun, 05 Jan 2020 22:25:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google;
        h=from:references:in-reply-to:mime-version:thread-index:date
         :message-id:subject:to:cc;
        bh=ktz53LcM4NbiHQEM/ryy99m1nMVxEfn9yjDtHJKQSMU=;
        b=CVsQXYPjSsqQqpDGIAoEBmGyyeGfBLpX6cre6IrzUWX1ycmguYir2YAdTjcygSNQyT
         dSM99q7x0fsNo6GdzsLuvCy9SxwTp0BanpX2D9uCVewELf7/N+fvyursGHqicBLyGGw7
         cKpCd0d0LfJW8KumaFhpabw8KSLDkKAEGRLPg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:references:in-reply-to:mime-version
         :thread-index:date:message-id:subject:to:cc;
        bh=ktz53LcM4NbiHQEM/ryy99m1nMVxEfn9yjDtHJKQSMU=;
        b=RK8wmsJk6t1xqLvOL/mN7HthrNUKBfUpTxzIwOu0gWlmDv6lZk89uFeiZei/Di5+Ct
         6/0WKN7JFA064HpsvjAYEgTYINaCtzxiJfxmnRxjz7msy0wYxCxPPT5xcNCXeEYaXppX
         fIxwPYmb+NCEAgjsZkg6SwVh5QVWy/A6xJwLqhl7Kvy7r0RT/uijxZ8kHSQkP/oybiNT
         FJkL5MNNs9ovFekDguL17/haYRrk9W2/SW2YlTde/+17GLJ/ePX0AJntnWzPWzezlZcw
         518k6iASGLB8KAftWvBMxOBNG+yLgIYDiR3P+Wbm1Yx3l4XzNY/pxHfg6ODnr2jJs+jK
         Z5Jg==
X-Gm-Message-State: APjAAAXNIniOAvDyg33acYj7XK9oVJ2HYulRBGv+eAHVtBCpF6p04GXn
        dMdW/+7oJDxX1bZAWG2q68+L+f9FBKyWpFerlvgwLg==
X-Google-Smtp-Source: APXvYqwbDPjRkFQER5ywOqBUAAP0W3suQ+ZwUfvvcHPkNQ7+ZGioF35HQnWVcvEQPVCxES0oQyETmwPLORs5PbGzfow=
X-Received: by 2002:ac2:43a7:: with SMTP id t7mr51923621lfl.125.1578291924686;
 Sun, 05 Jan 2020 22:25:24 -0800 (PST)
From:   Vikas Gupta <vikas.gupta@broadcom.com>
References: <1578068404-26195-1-git-send-email-vikas.gupta@broadcom.com> <20200105.144746.2055568145717937218.davem@davemloft.net>
In-Reply-To: <20200105.144746.2055568145717937218.davem@davemloft.net>
MIME-Version: 1.0
X-Mailer: Microsoft Outlook 15.0
Thread-Index: AQE0opalCUsV5BygIsNN/3ef1GQcaQLm0oerqQg2PjA=
Date:   Mon, 6 Jan 2020 11:55:22 +0530
Message-ID: <96059280a7ebeb4e1ec92c78d053ccfe@mail.gmail.com>
Subject: RE: [PATCH INTERNAL v2] firmware: tee_bnxt: Fix multiple call to tee_client_close_context
To:     David Miller <davem@davemloft.net>
Cc:     zajec5@gmail.com, Sheetal Tigadoli <sheetal.tigadoli@broadcom.com>,
        netdev@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org, sumit.garg@linaro.org,
        Vasundhara Volam <vasundhara-v.volam@broadcom.com>,
        Vikram Prakash <vikram.prakash@broadcom.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

 "INTERNAL" and version "v2" added accidently. Please ignore this. I`ll
send updated patch.

-----Original Message-----
From: David Miller [mailto:davem@davemloft.net]
Sent: Monday, January 06, 2020 4:18 AM
To: vikas.gupta@broadcom.com
Cc: zajec5@gmail.com; sheetal.tigadoli@broadcom.com;
netdev@vger.kernel.org; linux-mips@vger.kernel.org;
linux-kernel@vger.kernel.org; sumit.garg@linaro.org;
vasundhara-v.volam@broadcom.com; vikram.prakash@broadcom.com
Subject: Re: [PATCH INTERNAL v2] firmware: tee_bnxt: Fix multiple call to
tee_client_close_context


What does "INTERNAL" mean in these patch Subject lines?
