Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 540D71471F8
	for <lists+linux-mips@lfdr.de>; Thu, 23 Jan 2020 20:44:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728809AbgAWTol (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 23 Jan 2020 14:44:41 -0500
Received: from mail-pg1-f194.google.com ([209.85.215.194]:38664 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729012AbgAWTol (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 23 Jan 2020 14:44:41 -0500
Received: by mail-pg1-f194.google.com with SMTP id a33so1895162pgm.5;
        Thu, 23 Jan 2020 11:44:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:from:to:cc:cc:cc:subject
         :references:in-reply-to;
        bh=nHOYBJJRZELfwjYwt28Qy+NPDprPQ6JWN7h0Dm2UYxM=;
        b=grA/b11h7mZH/wiNvIeXW//e3YR54LsOljfdN+LfN6axJi5B7CZ0HV9npywNgblrDt
         ImAPwS9c6SOwUnQ10q+w8pxATxZW3lVww3GVVdTMU8S75pwv4MjWyOCrgxhbWtc6nNdo
         DH9SWup1j5e8GQDLNXg5972WCNXh3eZWduHSG8Ld67NRMAeJuyzO7oDAsx66hviPSUFo
         AwMKLMQtnHSrU6HBzsgbFvzlA/CFyp990rPUgRwY9E44ZfTLtSXLb1oLWAKJYTjK7cAt
         Fc2KMf4qzdt60zo0Q6t0EMi0WrOe5/POFImvT5LOOhhtS2R5LHpcnBE8HZSqM2kJzntK
         kUgw==
X-Gm-Message-State: APjAAAVGcZoKDvpG2qY/n7XYgb0Ye0ZhbxjXf9MV0Wqe8Hzdjhfr0F/z
        5PD0mHboJqmIsOQEPs949Cq/fdYzJHTu8w==
X-Google-Smtp-Source: APXvYqwacpy9q4WLfMw+jTbB+lsEJJ9ZtgbK+f/yIKZ3/KUtOdETSrcUoUuKNAanDGekzvHkCTQacw==
X-Received: by 2002:a62:f94d:: with SMTP id g13mr8685479pfm.60.1579808679970;
        Thu, 23 Jan 2020 11:44:39 -0800 (PST)
Received: from localhost (MIPS-TECHNO.ear1.SanJose1.Level3.net. [4.15.122.74])
        by smtp.gmail.com with ESMTPSA id a16sm3761309pgb.5.2020.01.23.11.44.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jan 2020 11:44:39 -0800 (PST)
Message-ID: <5e29f7a7.1c69fb81.d519d.94af@mx.google.com>
Date:   Thu, 23 Jan 2020 11:44:38 -0800
From:   Paul Burton <paulburton@kernel.org>
To:     Sergey Korolev <s.korolev@ndmsystems.com>
CC:     linux-mips@vger.kernel.org
CC:     s.korolev@ndmsystems.com, Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paulburton@kernel.org>,
        James Hogan <jhogan@kernel.org>, linux-kernel@vger.kernel.org
CC:     linux-mips@vger.kernel.org
Subject: Re: [PATCH] MIPS: sync-r4k: do slave counter synchronization with  disabled HW interrupts
References:  <20200122123909.8188-1-s.korolev@ndmsystems.com>
In-Reply-To:  <20200122123909.8188-1-s.korolev@ndmsystems.com>
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hello,

Sergey Korolev wrote:
> synchronise_count_slave() called with an enabled in mips_clockevent_init()
> timer interrupt which may decrease synchronization precision.

Applied to mips-next.

> commit 0956be29a96c
> https://git.kernel.org/mips/c/0956be29a96c
> 
> Signed-off-by: Sergey Korolev <s.korolev@ndmsystems.com>
> Signed-off-by: Paul Burton <paulburton@kernel.org>

Thanks,
    Paul

[ This message was auto-generated; if you believe anything is incorrect
  then please email paulburton@kernel.org to report it. ]
