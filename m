Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 12C9B136083
	for <lists+linux-mips@lfdr.de>; Thu,  9 Jan 2020 19:52:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388590AbgAISwb (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 9 Jan 2020 13:52:31 -0500
Received: from mail-pg1-f193.google.com ([209.85.215.193]:36551 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730273AbgAISwb (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 9 Jan 2020 13:52:31 -0500
Received: by mail-pg1-f193.google.com with SMTP id k3so3641243pgc.3;
        Thu, 09 Jan 2020 10:52:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:from:to:cc:cc:cc:subject
         :references:in-reply-to;
        bh=/BAqD0l+U83NH1RGSfzcWZQsiJzjl7183QqqyS1Fo7Q=;
        b=M4eGhbsgisg+94qlBajzj3M2JwTjI9PiYDGiso3fenQa2TcMmjODG8jcYkc9i8ZOI8
         wf4vRzVtNXUkmwLlSvelx1IMNEqHcLfL0bpKtFKGKS5m/YHjwJzownKjSreEUUUASUVV
         JvI7CZI9TohaWXinZWIwJrukflTnbaclF3683MK5xvNLLUUJWhaQ9CIDukGTEHHYXJtc
         0kzqKcV8BWO/TvBE6NJgJA1xnEcsIJfpM/3qtP7TDethzzJ6OIrf/FmHA6NoZhwLQuLt
         YX4THryXr5Y/vrnVvfS43cvabygL2rzYZw0LGiAItMxMVWd3t4XJp6XOy41TrmnazufD
         PHMw==
X-Gm-Message-State: APjAAAWvpQSD7KR5VL8ESebWYtcwDXcJvNU+IZdPI+/2Jmgn9X9QsfTo
        lIg3R68dZMzfmQ173CA9GNg=
X-Google-Smtp-Source: APXvYqyZpF90AQBz/1Us2pQyaSH42OFP5AqFZ5uOYa6ViVC/ACpU6AhH3y1g8yuh7AoDADOMEIndAw==
X-Received: by 2002:aa7:96c7:: with SMTP id h7mr12316286pfq.211.1578595950166;
        Thu, 09 Jan 2020 10:52:30 -0800 (PST)
Received: from localhost (MIPS-TECHNO.ear1.SanJose1.Level3.net. [4.15.122.74])
        by smtp.gmail.com with ESMTPSA id z64sm8902610pfz.23.2020.01.09.10.52.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jan 2020 10:52:29 -0800 (PST)
Message-ID: <5e17766d.1c69fb81.71d2b.581c@mx.google.com>
Date:   Thu, 09 Jan 2020 10:52:28 -0800
From:   Paul Burton <paulburton@kernel.org>
To:     =?utf-8?b?5ZGo55Cw5p2wIChaaG91IFlhbmppZSk=?= 
        <zhouyanjie@wanyeetech.com>
CC:     linux-mips@vger.kernel.org
CC:     linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        robh+dt@kernel.org, paul.burton@mips.com, paulburton@kernel.org,
        jhogan@kernel.org, mripard@kernel.org, shawnguo@kernel.org,
        mark.rutland@arm.com, alexandre.belloni@bootlin.com,
        ralf@linux-mips.org, heiko@sntech.de, icenowy@aosc.io,
        ak@linux.intel.com, laurent.pinchart@ideasonboard.com,
        krzk@kernel.org, geert+renesas@glider.be, paul@crapouillou.net,
        prasannatsmkumar@gmail.com, keescook@chromium.org,
        ebiederm@xmission.com, sernia.zhou@foxmail.com,
        zhenwenjin@gmail.com, 772753199@qq.com
CC:     linux-mips@vger.kernel.org
Subject: Re: [PATCH v8 1/4] MIPS: Ingenic: Add Ingenic X1000 support.
References:  <1575979363-25956-2-git-send-email-zhouyanjie@wanyeetech.com>
In-Reply-To:  <1575979363-25956-2-git-send-email-zhouyanjie@wanyeetech.com>
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hello,

周琰杰 (Zhou Yanjie) wrote:
> Support the Ingenic X1000 SoC using the code under arch/mips/jz4740.
> This is left unselectable in Kconfig until a X1000 based board is
> added in a later commit.

Series applied to mips-next.

> MIPS: Ingenic: Add Ingenic X1000 support.
>   commit 7a16ccd300c2
>   https://git.kernel.org/mips/c/7a16ccd300c2
>   
>   Signed-off-by: 周琰杰 (Zhou Yanjie) <zhouyanjie@wanyeetech.com>
>   Signed-off-by: Paul Burton <paulburton@kernel.org>
> 
> dt-bindings: Document yna vendor-prefix.
>   commit 9d022be3c192
>   https://git.kernel.org/mips/c/9d022be3c192
>   
>   Signed-off-by: 周琰杰 (Zhou Yanjie) <zhouyanjie@wanyeetech.com>
>   Acked-by: Rob Herring <robh@kernel.org>
>   Signed-off-by: Paul Burton <paulburton@kernel.org>
> 
> dt-bindings: MIPS: Add Ingenic XBurst based boards.
>   commit 4b396e56a0b8
>   https://git.kernel.org/mips/c/4b396e56a0b8
>   
>   Signed-off-by: 周琰杰 (Zhou Yanjie) <zhouyanjie@wanyeetech.com>
>   Reviewed-by: Rob Herring <robh@kernel.org>
>   Signed-off-by: Paul Burton <paulburton@kernel.org>
> 
> MIPS: Ingenic: Add YSH & ATIL CU Neo board support.
>   commit 0cd2c6e5701e
>   https://git.kernel.org/mips/c/0cd2c6e5701e
>   
>   Signed-off-by: 周琰杰 (Zhou Yanjie) <zhouyanjie@wanyeetech.com>
>   Acked-by: Paul Cercueil <paul@crapouillou.net>
>   [paulburton@kernel.org:
>     Drop stale mention of previously unselectable Kconfig entry.]
>   Signed-off-by: Paul Burton <paulburton@kernel.org>

Thanks,
    Paul

[ This message was auto-generated; if you believe anything is incorrect
  then please email paulburton@kernel.org to report it. ]
