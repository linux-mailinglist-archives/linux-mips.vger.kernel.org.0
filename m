Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7BF3F77059E
	for <lists+linux-mips@lfdr.de>; Fri,  4 Aug 2023 18:06:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232304AbjHDQG4 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 4 Aug 2023 12:06:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58676 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232216AbjHDQGt (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 4 Aug 2023 12:06:49 -0400
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1ECFA46B1
        for <linux-mips@vger.kernel.org>; Fri,  4 Aug 2023 09:06:48 -0700 (PDT)
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-99c10ba30afso722840266b.1
        for <linux-mips@vger.kernel.org>; Fri, 04 Aug 2023 09:06:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1691165201; x=1691770001;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iO5rwUzHdvsTta4AYoM7PZm/e8fMyDOqZiTH6w2WucI=;
        b=AMUKG0O3ZHryKLr0tnTo/WTbH6EIhzWu2/l3KbipyDRSvc4gTMborJHpukGwA9PrV/
         2vL1fAteIN2zhSb8OrF3fDoffz9wHnACihFdMSwHU+PJLv1tWJqlym5Yikhypq+ZjtH5
         XvAFdLNHmEGqT0fEZ+4UyKWvd0dD4G7ZOzrc4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691165201; x=1691770001;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iO5rwUzHdvsTta4AYoM7PZm/e8fMyDOqZiTH6w2WucI=;
        b=CD2nTwM2mKEHDyTsBvj/Q3xenzMljj/t4gzPjzetxhPyLDhTd2UBn+WxZiu2lk1XpO
         SeyWZulHFYSmpt1uhPUKSs4x4v0QhbyLFNmLhq+uvrv3Hzt5kdOODx8svBLd+9sqcaaA
         NL0zhpMpD8QhkoEfsbm87KNGQdt6gae6vcVjVzh0Z2jPUUlZGUfRGS+hDVZO0jBb2FMG
         03hXKZhlYhIj6diJmYgV2YDqauVoMgYGYh/feeXhOga/OF2HlwmSOFBvTo6lhGD14FAu
         59a3f/2RFWyTrVFHV2uOnGLxAZUCiAxE6GYFD7flsJ5QepRywox7997TtUjV3XsXi+2/
         AycQ==
X-Gm-Message-State: AOJu0YzzuVMRQC4vXK7sm60E/uW7Ku193cN32XugC/SDGzAt8SsyfLBd
        zMJfEqblSDjRprfpo3QByE0zz09/QGEtBc6DmIhez7bD
X-Google-Smtp-Source: AGHT+IHD5ZShCrZy9ttksaCeaiivQLi3MfVUW7w+XF39SaMR0lg6uvJtEWawaN1YxWV3uiYxSKCoGg==
X-Received: by 2002:a17:907:2c4a:b0:98e:2413:952f with SMTP id hf10-20020a1709072c4a00b0098e2413952fmr139241ejc.18.1691165201649;
        Fri, 04 Aug 2023 09:06:41 -0700 (PDT)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com. [209.85.128.54])
        by smtp.gmail.com with ESMTPSA id v2-20020a1709063bc200b009890e402a6bsm1502028ejf.221.2023.08.04.09.06.41
        for <linux-mips@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Aug 2023 09:06:41 -0700 (PDT)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-3fe2d620d17so105725e9.0
        for <linux-mips@vger.kernel.org>; Fri, 04 Aug 2023 09:06:41 -0700 (PDT)
X-Received: by 2002:a50:d0dd:0:b0:522:2dd2:afa5 with SMTP id
 g29-20020a50d0dd000000b005222dd2afa5mr73563edf.7.1691165180310; Fri, 04 Aug
 2023 09:06:20 -0700 (PDT)
MIME-Version: 1.0
References: <20230803160649.v3.1.Ia35521b91fc781368945161d7b28538f9996c182@changeid>
 <ZMytyEoCARgP9VR8@dhcp22.suse.cz> <CAD=FV=UQ18JG-sMBJHrhXByCWYSgOpCq8tL=3R8pT8CnFEa=pA@mail.gmail.com>
 <ZM0S9gKBBiu83kFq@dhcp22.suse.cz>
In-Reply-To: <ZM0S9gKBBiu83kFq@dhcp22.suse.cz>
From:   Doug Anderson <dianders@chromium.org>
Date:   Fri, 4 Aug 2023 09:06:07 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XhksUsBKjkD08YxdmxvvbgoZH-va7WnPptkYA6EOpPsg@mail.gmail.com>
Message-ID: <CAD=FV=XhksUsBKjkD08YxdmxvvbgoZH-va7WnPptkYA6EOpPsg@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] nmi_backtrace: Allow excluding an arbitrary CPU
To:     Michal Hocko <mhocko@suse.com>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Petr Mladek <pmladek@suse.com>, Arnd Bergmann <arnd@arndb.de>,
        Borislav Petkov <bp@alien8.de>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        "Darrick J. Wong" <djwong@kernel.org>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        "David S. Miller" <davem@davemloft.net>,
        Gaosheng Cui <cuigaosheng1@huawei.com>,
        "Gautham R. Shenoy" <gautham.shenoy@amd.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Guilherme G. Piccoli" <gpiccoli@igalia.com>,
        Guo Ren <guoren@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>,
        Huacai Chen <chenhuacai@kernel.org>,
        Ingo Molnar <mingo@redhat.com>,
        "Jason A. Donenfeld" <Jason@zx2c4.com>,
        Jianmin Lv <lvjianmin@loongson.cn>,
        Jinyang He <hejinyang@loongson.cn>,
        Josh Poimboeuf <jpoimboe@kernel.org>,
        Kees Cook <keescook@chromium.org>,
        Lecopzer Chen <lecopzer.chen@mediatek.com>,
        Marc Zyngier <maz@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        "Paul E. McKenney" <paulmck@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Pingfan Liu <kernelfans@gmail.com>,
        Qing Zhang <zhangqing@loongson.cn>,
        "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
        Russell King <linux@armlinux.org.uk>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Thomas Gleixner <tglx@linutronix.de>,
        Tom Rix <trix@redhat.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Valentin Schneider <vschneid@redhat.com>,
        WANG Xuerui <kernel@xen0n.name>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        loongarch@lists.linux.dev, sparclinux@vger.kernel.org,
        x86@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi,

On Fri, Aug 4, 2023 at 8:02=E2=80=AFAM Michal Hocko <mhocko@suse.com> wrote=
:
>
> > > It would have been slightly safer to modify arch_trigger_cpumask_back=
trace
> > > by switching arguments so that some leftovers are captured easier.
> >
> > I'm not sure I understand. Oh, you're saying make the prototype of
> > arch_trigger_cpumask_backtrace() incompatible so that if someone is
> > directly calling it then it'll be a compile-time error?
>
> exactly. bool to int promotion would be too easy to miss while the
> pointer to int would complain loudly.
>
> > I guess the
> > hope is that nobody is calling that directly and they're calling
> > through the trigger_...() functions.
>
> Hope is one thing, being preventive another.
>
> > For now I'm going to leave this alone.
>
> If you are going to send another version then please consider this. Not
> a hard requirement but better.

If I do send another version, do you have any suggestions for how to
change this to make it incompatible? I guess swapping the order of the
parameters would be best? I considered doing that for v4 but I felt
like long term the current order of the parameters was better. I also
considered a rename, but that different problems. ;-) If I rename both
the #define and the function then if someone has an out-of-tree patch
adding arch_trigger_cpumask_backtrace() for another architecture, like
say arm64, then there would be no compile-time failure indicating that
the out-of-tree patch needs updating. I could rename the functions but
_not_ the #define, I guess?
