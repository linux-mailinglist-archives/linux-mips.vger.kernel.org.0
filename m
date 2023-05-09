Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E3F726FD06C
	for <lists+linux-mips@lfdr.de>; Tue,  9 May 2023 23:01:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229734AbjEIVBi (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 9 May 2023 17:01:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53452 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234547AbjEIVBh (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 9 May 2023 17:01:37 -0400
Received: from mail-yw1-x112b.google.com (mail-yw1-x112b.google.com [IPv6:2607:f8b0:4864:20::112b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF22365A8
        for <linux-mips@vger.kernel.org>; Tue,  9 May 2023 14:00:58 -0700 (PDT)
Received: by mail-yw1-x112b.google.com with SMTP id 00721157ae682-559ded5e170so94349647b3.3
        for <linux-mips@vger.kernel.org>; Tue, 09 May 2023 14:00:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1683666058; x=1686258058;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1ek4N4zhVnFp0OjD2e91cJw6qEMFFDQc5/FTgmHiGak=;
        b=KvksaCpKrzaY0+3FUW5oyI//dFtyxPTQHfzl5+0VHvQcVCTA/wc5skYbfQaGQAiqO6
         RG+BFjA1uT+YcH6WAEZj1dAYjHu44a/fsNy0DucHqAiFcc0aHh0TP0/SHym2wtLFhgya
         jvcVrNDfs1uLf3q9XYKlS2tP9Nf6+clp3l9kNKu7ghj3ZCYhSVgo0DyhzvOiItYtumh1
         4JQnslNgjT5PK1cZo9gjIG01FVTUxhvtvM1wwCOMTIKO+8A4D8darjFAiHGGXkHMA/wC
         qK2Wu25nEc78g+A7cmmAaUVZiu2rHo/uQi1GdwXanr4ugUOWKbNzFsu5Od9kub1ggvSe
         EDcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683666058; x=1686258058;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1ek4N4zhVnFp0OjD2e91cJw6qEMFFDQc5/FTgmHiGak=;
        b=ZWZDgqlocdGMQsxLrV2v91715C1Q3YMCRi3iq/tLEW00K+G8yU3B7fsD3BNbrUpGAN
         /N1hX4TtmBPTvYU6ltJ9pEolBPcordGBjhlHvWWqmxGZaUGRYcLpl6bpmGjJs1xll6W3
         a3eaYM/s8Qrda3LfL0vbmbxy21T8UC9uVXNqONW/3MAsPLTTi+Pp7sP4ogxqqSpzXjmz
         h5u5mGFQcOuPp+2FVLol1jF0fWw+tXCGwZJCQ9aXmMQ37UHGJHzMSjkqBWhZteYdu2qy
         McuYt8mRzIYsNe83eqOl0ZKajzjSSqDT77PBj7oG51Cl254NR3bWTngynsQwIxjZI/Kh
         KDpA==
X-Gm-Message-State: AC+VfDyBL0qVeHVZflKOiwNEbqHAMFxySaXoQZR4A0HdZWS5BHUpVG8r
        SQEXOLMm0NPMWjQZJNuaXHVXD5KLq37usIpBgSjkQ7uvIfFa8aY4txs=
X-Google-Smtp-Source: ACHHUZ5qUtibgquXG1CHXn5rsYEnNugGuamTPmXoGAjYsiSltyM3mefeFrXCpD+c8boXnApqrdpstv0ZlJ4ZhdJ1iOQ=
X-Received: by 2002:a67:f291:0:b0:42e:6748:13dc with SMTP id
 m17-20020a67f291000000b0042e674813dcmr5348659vsk.0.1683665528538; Tue, 09 May
 2023 13:52:08 -0700 (PDT)
MIME-Version: 1.0
References: <20230306190156.434452-1-dmatlack@google.com>
In-Reply-To: <20230306190156.434452-1-dmatlack@google.com>
From:   David Matlack <dmatlack@google.com>
Date:   Tue, 9 May 2023 13:51:42 -0700
Message-ID: <CALzav=fZFpzw57hNmg2fqYG-0ddtvQd9+=7cw8tzuOGbZW1A1A@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] KVM: Refactor KVM stats macros and enable custom
 stat names
To:     Paolo Bonzini <pbonzini@redhat.com>
Cc:     Marc Zyngier <maz@kernel.org>,
        Oliver Upton <oliver.upton@linux.dev>,
        James Morse <james.morse@arm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Zenghui Yu <yuzenghui@huawei.com>,
        Huacai Chen <chenhuacai@kernel.org>,
        Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
        Anup Patel <anup@brainfault.org>,
        Atish Patra <atishp@atishpatra.org>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Christian Borntraeger <borntraeger@linux.ibm.com>,
        Janosch Frank <frankja@linux.ibm.com>,
        Claudio Imbrenda <imbrenda@linux.ibm.com>,
        David Hildenbrand <david@redhat.com>,
        Sean Christopherson <seanjc@google.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Eric Farman <farman@linux.ibm.com>,
        =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>,
        Sathvika Vasireddy <sv@linux.ibm.com>,
        Nicholas Piggin <npiggin@gmail.com>,
        linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
        linux-mips@vger.kernel.org, kvm@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org,
        linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, Mar 6, 2023 at 11:01=E2=80=AFAM David Matlack <dmatlack@google.com>=
 wrote:
>
> This series refactors the KVM stats macros to reduce duplication and
> adds the support for choosing custom names for stats.

Hi Paolo,

I just wanted to double-check if this series is on your radar
(probably for 6.5)?
