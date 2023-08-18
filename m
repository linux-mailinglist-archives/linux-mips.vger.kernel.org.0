Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B579A78159B
	for <lists+linux-mips@lfdr.de>; Sat, 19 Aug 2023 01:04:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241928AbjHRXD7 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 18 Aug 2023 19:03:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58738 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241927AbjHRXDo (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 18 Aug 2023 19:03:44 -0400
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com [IPv6:2607:f8b0:4864:20::b4a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C48E12B
        for <linux-mips@vger.kernel.org>; Fri, 18 Aug 2023 16:03:43 -0700 (PDT)
Received: by mail-yb1-xb4a.google.com with SMTP id 3f1490d57ef6-d61e9cb310dso1774270276.0
        for <linux-mips@vger.kernel.org>; Fri, 18 Aug 2023 16:03:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1692399822; x=1693004622;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=28NglzIO6cp/vzLfU4W3yc26zb3SzMF2NIoeJVJxjcQ=;
        b=EVGfgwe5loZZR0WMUgpJEOZteslGNWIqlIRhDe/gbts+F4/yw7LopoWIr9pAXN/gct
         vmDVXSSz1qYQsgmOG56EVjufIZ8uHJIc0K2fjYh54YGOjsi7Y2c13ZQR7k+mneDCdJ6K
         fzW5DxeEtavJtj3e3uV6c2SWgwD/YmEbj2Rv9dwQ6wRuQzmdnahyzKBwtcnM92PUpCV2
         6SViYhyQd8PzIgA5SnclKlRnW0JgjAUS06yCK7QyV0vkFW6Zt0VuYiJbLr9XMzWwR30M
         Wq85gyIx9s0/FGvGJHcq/Jks4zP9GUvni76QMTBxGvpnvPGwvzqq5FqhBNo14dUbWrMQ
         g0nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692399822; x=1693004622;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=28NglzIO6cp/vzLfU4W3yc26zb3SzMF2NIoeJVJxjcQ=;
        b=kZ220jOJUI4evUgYDXHW/wtqg4Ro7dD12eXSfJ31ZyQ65dgEYJYPQ715+RIqUN4eNM
         QYzUHptPqOVlbX8h3regYl/a00n/giEhWheIzRmvud5WloLBCTUYZ+exv39Uee8f6XQ3
         3ELc2orzB0ki5gymnbQtC26I+8F2s4nF/e3SWmhmK0THeBByD6iz9XMPur+XrCY2xY2/
         7jJzaC7xxYFdAhje2epCbjRfTWzgXo+gLkxyk3BscBA9EJTLV5rE3svfCZX23lW+RzvS
         DjOnAMndi6wZYxG+KuGInnxDrOUUNfevqL/ewNw6vGyBjFJDPyANKYh786JbJJBVBN25
         0Y+g==
X-Gm-Message-State: AOJu0YwJGA8j/TUhR6Zv1SIroGFXMgZfOj0uElukQ9Gq5qwMtAo6aMJ/
        mHg/YftUZ0Nfbe33UvTRCkugASBOoX8=
X-Google-Smtp-Source: AGHT+IEiW/RghuqZOFRro09VfZa9EIt3/32aXeBy5eI/raBp2zbRsudvcD77PZeJQ//x65k1pSmrq3qMqqs=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a25:d149:0:b0:d4c:2a34:aeab with SMTP id
 i70-20020a25d149000000b00d4c2a34aeabmr6800ybg.11.1692399822583; Fri, 18 Aug
 2023 16:03:42 -0700 (PDT)
Date:   Fri, 18 Aug 2023 16:03:41 -0700
In-Reply-To: <diqzo7ji30eo.fsf@ackerleytng-ctop.c.googlers.com>
Mime-Version: 1.0
References: <20230718234512.1690985-29-seanjc@google.com> <diqzo7ji30eo.fsf@ackerleytng-ctop.c.googlers.com>
Message-ID: <ZN/4zZFrsPdh/mLo@google.com>
Subject: Re: [RFC PATCH v11 28/29] KVM: selftests: Add basic selftest for guest_memfd()
From:   Sean Christopherson <seanjc@google.com>
To:     Ackerley Tng <ackerleytng@google.com>
Cc:     pbonzini@redhat.com, maz@kernel.org, oliver.upton@linux.dev,
        chenhuacai@kernel.org, mpe@ellerman.id.au, anup@brainfault.org,
        paul.walmsley@sifive.com, palmer@dabbelt.com,
        aou@eecs.berkeley.edu, willy@infradead.org,
        akpm@linux-foundation.org, paul@paul-moore.com, jmorris@namei.org,
        serge@hallyn.com, kvm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
        linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org,
        linux-fsdevel@vger.kernel.org, linux-mm@kvack.org,
        linux-security-module@vger.kernel.org,
        linux-kernel@vger.kernel.org, chao.p.peng@linux.intel.com,
        tabba@google.com, jarkko@kernel.org, yu.c.zhang@linux.intel.com,
        vannapurve@google.com, mail@maciej.szmigiero.name, vbabka@suse.cz,
        david@redhat.com, qperret@google.com, michael.roth@amd.com,
        wei.w.wang@intel.com, liam.merwick@oracle.com,
        isaku.yamahata@gmail.com, kirill.shutemov@linux.intel.com
Content-Type: text/plain; charset="us-ascii"
X-Spam-Status: No, score=-9.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, Aug 07, 2023, Ackerley Tng wrote:
> Sean Christopherson <seanjc@google.com> writes:
> > +	ret = fallocate(fd, FALLOC_FL_KEEP_SIZE, total_size + page_size, page_size);
> > +	TEST_ASSERT(ret, "fallocate beginning at total_size should fail");
> 
> This should be
> 
> TEST_ASSERT(ret, "fallocate beginning after total_size should fail");

Roger that, I'll push a fixup commit directly to kvm-x86/guest_memfd.  Thanks!
