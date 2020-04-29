Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0C3F21BD55E
	for <lists+linux-mips@lfdr.de>; Wed, 29 Apr 2020 09:04:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726567AbgD2HEz (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 29 Apr 2020 03:04:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48252 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726274AbgD2HEz (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 29 Apr 2020 03:04:55 -0400
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED759C03C1AD;
        Wed, 29 Apr 2020 00:04:54 -0700 (PDT)
Received: by mail-wm1-x341.google.com with SMTP id z6so756287wml.2;
        Wed, 29 Apr 2020 00:04:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:reply-to:from:date:message-id
         :subject:to:cc;
        bh=lZ6vcTjHNoVR0BCaYLoW2vQQfiZtE3GkLmVwbDb3kKs=;
        b=tVreQPq4FATIBvu29HrXIQXOrj6WwT6KHRsB7KD9AzBZVIN3KBo0PEoYV+HeelarpS
         Sb/qfsKwowYEdswNRMNVmX8eC2vJkhpO5g2W0dZ1ICyiavdllNmR9MzXvW0O3tXGJD4r
         g94GHReNjAzQlbz0VzgLe9d6OS005K/Xwi7NCYR/q+oMHnOlMc/N7M25nde/Mn/Ky41D
         cXwo6OZPEmnu6eRnWHYMvCdnqL1CIYIAKHv4PKXsIOGwwtzd2fbRuv+RGIntfEE6ZgST
         fQ0o1Y04zSe5ASD/PCzCse424ALd5u2SJITmillubtxw8m5JSmdlI3g+fzvEWOkNwrzR
         lFhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
         :from:date:message-id:subject:to:cc;
        bh=lZ6vcTjHNoVR0BCaYLoW2vQQfiZtE3GkLmVwbDb3kKs=;
        b=oDobdlitjKJ3OU2rcUFRwQLraXbOGRsChXG/Dv1eubHmTVJboIWIWwq7vy6LrUSyOe
         2rCXoPmHHbKXvX4tz+zfZApnTmOk2+lY83Ud9UVPMHfRYffB0f6esENCxZyiYDdWjIWf
         6X+Y1SRJtMoR7kALsysR9a97LaepUj4e+6VUkz7IGob/oKh135f+D+9XQGwnri9sOM4N
         VSXSXq69KDJQV5WhnJk2f2Z06lZegxi8fUsg+YvpcFNvDOfaaMux8xmMazADXPL/dUGe
         9qNvW642FXFVXk8rWObM5BavPjN3V1AElldXJWdKl999pmQ18UXMKzl/vuyQObuvem6W
         /+ig==
X-Gm-Message-State: AGi0PuaaHVE7gFRcFOk6O3dBfaRTDnYKhlIUqIltXI+SlrDRnBmxlqj3
        rHBbSbbcXIgMK5RlyX/eWZAbLcOEF8fvtW8nmeIlT9bH
X-Google-Smtp-Source: APiQypI3Iq8207zhRpNrY8dIDiLkFXeP/Fd4LMrDY3WkIFCs42hS9q/Na1H3690kVE+VCKXnGkPO2BRaF2kfMfu1LVk=
X-Received: by 2002:a1c:7416:: with SMTP id p22mr1615489wmc.80.1588143893648;
 Wed, 29 Apr 2020 00:04:53 -0700 (PDT)
MIME-Version: 1.0
References: <20200423171807.29713-1-natechancellor@gmail.com> <20200428221419.2530697-1-natechancellor@gmail.com>
In-Reply-To: <20200428221419.2530697-1-natechancellor@gmail.com>
Reply-To: sedat.dilek@gmail.com
From:   Sedat Dilek <sedat.dilek@gmail.com>
Date:   Wed, 29 Apr 2020 09:04:42 +0200
Message-ID: <CA+icZUVz8zYVY3rgT4hS6a11+1Pw6y_Du-hkPra1PkgtLWgRbA@mail.gmail.com>
Subject: Re: [PATCH v5 0/5] Allow ld.lld to link the MIPS VDSO
To:     Nathan Chancellor <natechancellor@gmail.com>
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Masahiro Yamada <masahiroy@kernel.org>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Clang-Built-Linux ML <clang-built-linux@googlegroups.com>,
        linux-kbuild@vger.kernel.org,
        Nick Desaulniers <ndesaulniers@google.com>,
        Fangrui Song <maskray@google.com>,
        Sami Tolvanen <samitolvanen@google.com>,
        Dmitry Golovin <dima@golovin.in>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, Apr 29, 2020 at 12:14 AM Nathan Chancellor
<natechancellor@gmail.com> wrote:

> Patch 1 adds ld.lld support to Kconfig so that we can avoid certain
> ld.bfd checks.
>

Is it possible to introduce and add LD_IS_BFD Kconfig for ld.bfd in this series?
Most people agreed on this name AFAICS.
What do people think?

- Sedat -
