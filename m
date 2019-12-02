Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AA12B10F0FD
	for <lists+linux-mips@lfdr.de>; Mon,  2 Dec 2019 20:48:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728078AbfLBTsY (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 2 Dec 2019 14:48:24 -0500
Received: from mail-pj1-f66.google.com ([209.85.216.66]:46482 "EHLO
        mail-pj1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727686AbfLBTsX (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 2 Dec 2019 14:48:23 -0500
Received: by mail-pj1-f66.google.com with SMTP id z21so178029pjq.13;
        Mon, 02 Dec 2019 11:48:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:from:to:cc:cc:cc:subject
         :references:in-reply-to;
        bh=D40FmzaiDeff7Hw4DIG6QAZpF+IlnvRnFmWOCFVQkeY=;
        b=Pcoo7U2RvzgO1FrhfhekxKbtYRIAvFMA4vj86n1itjxGajiXRMU/pk34gq5l3nkaR8
         qlSooZlWlSi3p/evVJPbmNpWwom99qf1jpYYE2dR9PbiahtlPdAQYSNt79+nXVpjX4sG
         6xNBPtDxAHXiLWTtwc5gKzqpzliii2tH5u/h0JAqgFohLL5hRx30ndaghdQzbZ8rZGQi
         w8qVhJ/17rAg7XVnXUsJRi8198Gq3G/qvutSpiMuiDQ/8S0QAbvmieyWzFw0fxWFS4SJ
         Lzj3QV6OGgHHd9TOYikGLshLocSqng20aT7Wgv+r/mf7VYOtx4hZAMfRIzr8S9/IUdWE
         Y8Ng==
X-Gm-Message-State: APjAAAXrVCFtWPpsMqMd6tl5b2dBqg15LFV0OtNaaUxa9Qv/rPeXUB7O
        3Ar7n+TByYdfWi20y/+jgMM=
X-Google-Smtp-Source: APXvYqzhMvUbMVQWZZxcqeWMUPHlZmyKpQ0k15hR5TFCwWADR4qNUgPCmQKK4N4SR60tmXidIxq6Pg==
X-Received: by 2002:a17:902:6bc7:: with SMTP id m7mr828197plt.341.1575316101366;
        Mon, 02 Dec 2019 11:48:21 -0800 (PST)
Received: from localhost (MIPS-TECHNO.ear1.SanJose1.Level3.net. [4.15.122.74])
        by smtp.gmail.com with ESMTPSA id 2sm374265pgo.79.2019.12.02.11.48.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Dec 2019 11:48:20 -0800 (PST)
Message-ID: <5de56a84.1c69fb81.e0dc8.14af@mx.google.com>
Date:   Mon, 02 Dec 2019 11:48:19 -0800
From:   Paul Burton <paulburton@kernel.org>
To:     Vincenzo Frascino <vincenzo.frascino@arm.com>
CC:     vincenzo.frascino@arm.com, paulburton@kernel.org, hns@goldelico.com
CC:     mips-creator-ci20-dev@googlegroups.com,
        letux-kernel@openphoenux.org, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org
CC:     linux-mips@vger.kernel.org
Subject: Re: [PATCH] mips: Fix gettimeofday() in the vdso library
References:  <20191129143658.12224-1-vincenzo.frascino@arm.com>
In-Reply-To:  <20191129143658.12224-1-vincenzo.frascino@arm.com>
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hello,

Vincenzo Frascino wrote:
> The libc provides a discovery mechanism for vDSO library and its
> symbols. When a symbol is not exposed by the vDSOs the libc falls back
> on the system calls.
> 
> With the introduction of the unified vDSO library on mips this behavior
> is not honored anymore by the kernel in the case of gettimeofday().
> 
> The issue has been noticed and reported due to a dhclient failure on the
> CI20 board:
> 
> root@letux:~# dhclient
> ../../../../lib/isc/unix/time.c:200: Operation not permitted
> root@letux:~#
> 
> Restore the original behavior fixing gettimeofday() in the vDSO library.

Applied to mips-fixes.

> commit 7d2aa4bb90f5
> https://git.kernel.org/mips/c/7d2aa4bb90f5
> 
> Reported-by: H. Nikolaus Schaller <hns@goldelico.com>
> Tested-by: H. Nikolaus Schaller <hns@goldelico.com> # CI20 with JZ4780
> Signed-off-by: Vincenzo Frascino <vincenzo.frascino@arm.com>
> Signed-off-by: Paul Burton <paulburton@kernel.org>

Thanks,
    Paul

[ This message was auto-generated; if you believe anything is incorrect
  then please email paulburton@kernel.org to report it. ]
