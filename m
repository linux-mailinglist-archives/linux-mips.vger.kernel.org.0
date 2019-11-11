Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E8614F8093
	for <lists+linux-mips@lfdr.de>; Mon, 11 Nov 2019 20:51:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727073AbfKKTvx (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 11 Nov 2019 14:51:53 -0500
Received: from mail-pf1-f194.google.com ([209.85.210.194]:35477 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727054AbfKKTvt (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 11 Nov 2019 14:51:49 -0500
Received: by mail-pf1-f194.google.com with SMTP id d13so11416662pfq.2;
        Mon, 11 Nov 2019 11:51:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:from:to:cc:cc:cc:subject
         :references:in-reply-to;
        bh=vHxH19IQgcbR4vgRpwh24Vc6rZkeJyB8LwC+yDOdkQ4=;
        b=CA0qGfx1v6U5d4epIFs27NZyMp+N4AZowYpMqIWgiCFahwF+JlVAyxB0cP5Cpj+zVR
         Y6nGnv5K61YCLyXZ2xxyexarWEECnfGRuQWO+sL3M9WQLr1nDkSgIEYsk/ZKCVliLNnj
         fhI8UctipQDzXn1rmll3253b9SJfoEs/2sz5JkhqAmOfrmqWfKwRpJtWees9ky6qeIe2
         f5K5/h4zprDJFAUFUeU5dhXRDbfg6vIxZ98bnTcGyKJbZlTOse1/RQlD5qHhd58/kpZg
         Z0RQe4gKeJRHkqVhBeIpOCYxxaeAcNdRYBVF2Shmm2QiBIvPIf945goZ0NPk2Q/c9BIW
         Rg/Q==
X-Gm-Message-State: APjAAAVXRoVHdB+HhI1bagN9twp3iZZu6+yvwZ1wCxAKLPPGvouUuhXh
        u19z/2xEj7D8MHkCamcV6I8=
X-Google-Smtp-Source: APXvYqx/eIT+JhYVgguT+Zasw2XSSL8pmNNiDNZmWW+OrXIAwQEGtriZebB9kZFvTLrVCud569suBA==
X-Received: by 2002:a17:90a:a384:: with SMTP id x4mr1021459pjp.116.1573501908028;
        Mon, 11 Nov 2019 11:51:48 -0800 (PST)
Received: from localhost (MIPS-TECHNO.ear1.SanJose1.Level3.net. [4.15.122.74])
        by smtp.gmail.com with ESMTPSA id t1sm35420pfq.156.2019.11.11.11.51.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Nov 2019 11:51:47 -0800 (PST)
Message-ID: <5dc9bbd3.1c69fb81.93722.069b@mx.google.com>
Date:   Mon, 11 Nov 2019 11:51:47 -0800
From:   Paul Burton <paulburton@kernel.org>
To:     Alexey Khoroshilov <khoroshilov@ispras.ru>
CC:     Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paulburton@kernel.org>,
        James Hogan <jhogan@kernel.org>
CC:     Alexey Khoroshilov <khoroshilov@ispras.ru>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
CC:     linux-mips@vger.kernel.org
Subject: Re: [PATCH] MIPS: allow building with kcov coverage
References:  <1573061322-455-1-git-send-email-khoroshilov@ispras.ru>
In-Reply-To:  <1573061322-455-1-git-send-email-khoroshilov@ispras.ru>
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hello,

Alexey Khoroshilov wrote:
> Add ARCH_HAS_KCOV and HAVE_GCC_PLUGINS to MIPS config.
> Disable instrumentation of vdso to avoid build failure.

Applied to mips-next.

> commit dcf78ee66088
> https://git.kernel.org/mips/c/dcf78ee66088
> 
> Signed-off-by: Alexey Khoroshilov <khoroshilov@ispras.ru>
> Signed-off-by: Paul Burton <paulburton@kernel.org>

Thanks,
    Paul

[ This message was auto-generated; if you believe anything is incorrect
  then please email paulburton@kernel.org to report it. ]
