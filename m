Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 970AD18DB99
	for <lists+linux-mips@lfdr.de>; Sat, 21 Mar 2020 00:15:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727133AbgCTXPi (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 20 Mar 2020 19:15:38 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:36786 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727061AbgCTXPi (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 20 Mar 2020 19:15:38 -0400
Received: by mail-pg1-f194.google.com with SMTP id z72so3833964pgz.3
        for <linux-mips@vger.kernel.org>; Fri, 20 Mar 2020 16:15:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=FZ6hZNPoLZ3W3C9xVYQQv7OrgmFwsZ++Y7nIhZkGcpo=;
        b=jiYnz8bVXeq0itP0pxP27HI6/SYFsx300RilDAwVMZYhENQ1YftnGi51BSMCFMEIGD
         Dkj6k/GK6mNXm2Yd9UV1DDeUbp2pDtxcn3si5eYLO9dS/5edgb66cO+wVwzZAw5SzacK
         XtZNIOLqeOXUBk4/LwTuH36qyqw46Kl8DFl3o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=FZ6hZNPoLZ3W3C9xVYQQv7OrgmFwsZ++Y7nIhZkGcpo=;
        b=FLzil0eHdaAREQmpjlFiCVUBjs86/izfIVLvXrXDPBgJy0JIdaKg1cz0MrkYEQMYJH
         +XPbaGPbo9WLAERpC+R33Lmdi5tjT83pxLZ1zpvqg8E+/8MSIolteGNfVWJuchu1U8TL
         kbqqhppb6vhoypRpCoYXFX/G2lQIH0OJ6CYEqybuKPz92BBh4zLmSWZCJQS06PTE/nCA
         M4s/Mm1AgLNIsv+/YfjbZ3WKgHNcC+kUDmocduduavcJ+hjQaMi5BPuFGZt9MccbqKdP
         FFO0dLH4DlwBqWMcEY46X+PDao/mWsNEi1CRW1iIB3DWI8+8adjy9oqPEDtsTXW+SzZz
         wpbQ==
X-Gm-Message-State: ANhLgQ11zy2mWM9dBmoKX62/jaymwlLqTojHdL4uEGUGHTlx/F7FZDo1
        ZbmWx7kbuOWf2dVD64xrk0chHZ2LvBA=
X-Google-Smtp-Source: ADFU+vtydY5VUa4/aMdNCqTDJiiTqNfJKc15DKb+C4lCuklstLVnYRMwgrzRNWblISoaq5ADD2/j8w==
X-Received: by 2002:a63:214c:: with SMTP id s12mr10576578pgm.296.1584746137439;
        Fri, 20 Mar 2020 16:15:37 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id a15sm6552518pfg.77.2020.03.20.16.15.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2020 16:15:36 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200320145351.32292-27-vincenzo.frascino@arm.com>
References: <20200320145351.32292-1-vincenzo.frascino@arm.com> <20200320145351.32292-27-vincenzo.frascino@arm.com>
Subject: Re: [PATCH v5 26/26] arm64: vdso32: Enable Clang Compilation
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     Vincenzo Frascino <vincenzo.frascino@arm.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Russell King <linux@armlinux.org.uk>,
        Paul Burton <paul.burton@mips.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Andy Lutomirski <luto@kernel.org>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        Mark Salyzyn <salyzyn@android.com>,
        Kees Cook <keescook@chromium.org>,
        Peter Collingbourne <pcc@google.com>,
        Dmitry Safonov <0x7f454c46@gmail.com>,
        Andrei Vagin <avagin@openvz.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Marc Zyngier <maz@kernel.org>,
        Mark Rutland <Mark.Rutland@arm.com>,
        Nathan Chancellor <natechancellor@gmail.com>
To:     Vincenzo Frascino <vincenzo.frascino@arm.com>,
        clang-built-linux@googlegroups.com, linux-arch@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-mips@vger.kernel.org, x86@kernel.org
Date:   Fri, 20 Mar 2020 16:15:35 -0700
Message-ID: <158474613590.125146.6442368806113128893@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Quoting Vincenzo Frascino (2020-03-20 07:53:51)
> Enable Clang Compilation for the vdso32 library.
>=20
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Will Deacon <will@kernel.org>
> Reviewed-by: Nathan Chancellor <natechancellor@gmail.com>
> Tested-by: Nathan Chancellor <natechancellor@gmail.com> # build
> Acked-by: Catalin Marinas <catalin.marinas@arm.com>
> Signed-off-by: Vincenzo Frascino <vincenzo.frascino@arm.com>
> ---

Tested-by: Stephen Boyd <swboyd@chromium.org>
