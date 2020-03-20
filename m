Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 05B7918DBB4
	for <lists+linux-mips@lfdr.de>; Sat, 21 Mar 2020 00:21:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726801AbgCTXVJ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 20 Mar 2020 19:21:09 -0400
Received: from mail-pj1-f65.google.com ([209.85.216.65]:55226 "EHLO
        mail-pj1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726851AbgCTXVJ (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 20 Mar 2020 19:21:09 -0400
Received: by mail-pj1-f65.google.com with SMTP id np9so3160500pjb.4
        for <linux-mips@vger.kernel.org>; Fri, 20 Mar 2020 16:21:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=clkZQy76N5lqDvPEfomSFrpTluUVK0zQr3gsx7h7nC8=;
        b=Yu/8u83xc3BAK8swCPa1v47AYLOMOLAmKQCRaueAmpwbsZvhLe7j+g4VjaRWcl5977
         8fC/o3X/U6nxKRhiSjURBtP56L1M68KMGL+Rs1ZlLDmm5u4cAhnafvmSejO0Pqby2rfp
         hWfTochJhDhieWfuL68RKl+pRruYOx+rwqnvE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=clkZQy76N5lqDvPEfomSFrpTluUVK0zQr3gsx7h7nC8=;
        b=O9nl22M3nRozAMOL7TSEi4kVWh6n860pk3HhZabS7tXzlc0uUvuYnBqkzJgC0eFlkC
         3mTSe7PmWesBo6kVMwlE/XBn/Vos+IzBarJ/HLrsvGOTbva/FJuL/1p5ZSH3frdzwW/8
         KS2O6PW6JHCPGWg5By9+HoX6pZx6KiyI10uVs76RXYV8Xsj1f8CIS9LhXKwrhDHQTgNL
         FvlHhO2rpitTRfW3S+d7WgK8IA9hLiz6u8sW4G8qCs0QCUiuYOvAloxLzCJjMIGNRFdj
         CJKzMYmek8ymXeqp90lZN+O+HTHgaJTF4qJNmW3uD2Z/J577Ma9bQ/spctmPKFc++lUc
         ZmaA==
X-Gm-Message-State: ANhLgQ16QvmmyZqOfMh7CvoLeDryGO2ZvoJM5cmCrSpzzojQ8P+HPwbZ
        4jpzKzwTQoaoJNWVjX1NlIxtUQ==
X-Google-Smtp-Source: ADFU+vv6GHvXzRwWkdEiLmO10nDPyub2Yebvzznb5KqbElkhWXj+ptG2lYIyNxGql1P+Jw5Jn/kvcw==
X-Received: by 2002:a17:902:8e8b:: with SMTP id bg11mr11012475plb.138.1584746467739;
        Fri, 20 Mar 2020 16:21:07 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id w4sm3427639pfc.57.2020.03.20.16.21.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2020 16:21:07 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200320145351.32292-19-vincenzo.frascino@arm.com>
References: <20200320145351.32292-1-vincenzo.frascino@arm.com> <20200320145351.32292-19-vincenzo.frascino@arm.com>
Subject: Re: [PATCH v5 18/26] arm64: vdso32: Code clean up
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
        Mark Rutland <Mark.Rutland@arm.com>
To:     Vincenzo Frascino <vincenzo.frascino@arm.com>,
        clang-built-linux@googlegroups.com, linux-arch@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-mips@vger.kernel.org, x86@kernel.org
Date:   Fri, 20 Mar 2020 16:21:06 -0700
Message-ID: <158474646622.125146.3263940499372231797@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Quoting Vincenzo Frascino (2020-03-20 07:53:43)
> The compat vdso library had some checks that are not anymore relevant.

Can we get the information on why they aren't relevant anymore in the
commit text? I'd rather not find this commit three years from now and
have no idea why it was applied.

>=20
> Remove the unused code from the compat vDSO library.
>=20
> Note: This patch is preparatory for a future one that will introduce
> asm/vdso/processor.h on arm64.
>=20
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Will Deacon <will@kernel.org>
> Signed-off-by: Vincenzo Frascino <vincenzo.frascino@arm.com>
> Link: https://lore.kernel.org/lkml/20200317122220.30393-19-vincenzo.frasc=
ino@arm.com
