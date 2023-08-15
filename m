Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AAABF77C89A
	for <lists+linux-mips@lfdr.de>; Tue, 15 Aug 2023 09:34:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234660AbjHOHeS (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 15 Aug 2023 03:34:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45550 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235224AbjHOHd6 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 15 Aug 2023 03:33:58 -0400
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D90710F9
        for <linux-mips@vger.kernel.org>; Tue, 15 Aug 2023 00:33:57 -0700 (PDT)
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-986d8332f50so692418766b.0
        for <linux-mips@vger.kernel.org>; Tue, 15 Aug 2023 00:33:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1692084835; x=1692689635;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ptPuBEpK+bTuLrHXWomcWZqL5q0T5IOC69Hvw3A95bI=;
        b=h7n/uDShYxSNwBRM50GOcCYxuc5JsYL93sEbxiZjMXPXLrqKWNgGPMQHT55ERVVzUL
         rJ6DnJJzSLywuxsjaP6QrDBf6HopbKSrZ8QnrDztCvKFxUNp+GccUBrtgSDq/4TYZAKk
         fWvzz4oIF9Me0r7rMIjrl5MMY8kDEdukA6gUo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692084835; x=1692689635;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ptPuBEpK+bTuLrHXWomcWZqL5q0T5IOC69Hvw3A95bI=;
        b=X8Kc93mhv8mhdP3aDFrdhTaiI/EotM+gjFFyjMjm4NsTF0pV1K+xHjrd29TCLaVIQX
         gWlys2zAYUZR0BDwlKII0TN4LuFT/5ahESsNLghBfSurzCuEznmag9FfkoEK1ERHRqeZ
         1v7gj0PQwVeRr9lWPFdNCgvndfhsGDwVO6Vq4wF3sc84rrpoi3EtMNhyu4/7nDgAb+BX
         3v3ywvGSlfRA765omJ98SVJHW9c6HEOokiSY6gXZROmmKb0OEM34TTpcauHnF7GQFphg
         f5X4RKY2AuoXo1Dguhlzkyf1jvPPmkbaNK0RrlFr19lJ1TSNZSqVJFDYc+/KXvrU3lmu
         swhA==
X-Gm-Message-State: AOJu0Yw4QjBg7nD2RR6du1KTydl3UAsBYOkLnbfvX8rwo6XdZP02EVxY
        n3bdDyQm/fC82y98dQLanxD+fx7sIlU2hHgN/MSLvizN
X-Google-Smtp-Source: AGHT+IEtIdnChD/P1pMByj22pCAi1mQjRzog6tOwfPQSqZ17yfvCCNiSMJcU7U6SsieOld/lR3Db4Q==
X-Received: by 2002:a17:907:77cb:b0:993:f744:d230 with SMTP id kz11-20020a17090777cb00b00993f744d230mr8945270ejc.16.1692084835278;
        Tue, 15 Aug 2023 00:33:55 -0700 (PDT)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com. [209.85.208.46])
        by smtp.gmail.com with ESMTPSA id d18-20020a170906345200b0099297c99314sm6689812ejb.113.2023.08.15.00.33.53
        for <linux-mips@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Aug 2023 00:33:54 -0700 (PDT)
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-522dd6b6438so6396711a12.0
        for <linux-mips@vger.kernel.org>; Tue, 15 Aug 2023 00:33:53 -0700 (PDT)
X-Received: by 2002:a05:6402:290:b0:523:1004:1c9a with SMTP id
 l16-20020a056402029000b0052310041c9amr8202386edv.35.1692084833506; Tue, 15
 Aug 2023 00:33:53 -0700 (PDT)
MIME-Version: 1.0
References: <202308151426.97be5bd8-oliver.sang@intel.com>
In-Reply-To: <202308151426.97be5bd8-oliver.sang@intel.com>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Tue, 15 Aug 2023 07:33:36 +0000
X-Gmail-Original-Message-ID: <CAHk-=whbOEhPUL1m8Ua-+-E7kJXED4xa+duzRF-wJKR84NAPWg@mail.gmail.com>
Message-ID: <CAHk-=whbOEhPUL1m8Ua-+-E7kJXED4xa+duzRF-wJKR84NAPWg@mail.gmail.com>
Subject: Re: [linus:master] [locking] c8afaa1b0f: stress-ng.zero.ops_per_sec
 6.3% improvement
To:     kernel test robot <oliver.sang@intel.com>
Cc:     Mateusz Guzik <mjguzik@gmail.com>, oe-lkp@lists.linux.dev,
        lkp@intel.com, linux-kernel@vger.kernel.org,
        linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-ia64@vger.kernel.org, linux-mips@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, sparclinux@vger.kernel.org,
        linux-fsdevel@vger.kernel.org, ying.huang@intel.com,
        feng.tang@intel.com, fengwei.yin@intel.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, 15 Aug 2023 at 07:12, kernel test robot <oliver.sang@intel.com> wrote:
>
> kernel test robot noticed a 6.3% improvement of stress-ng.zero.ops_per_sec on:

WTF? That's ridiculous. Why would that even test new_inode() at all?
And why would it make any difference anyway to prefetch a new inode?
The 'zero' test claims to just read /dev/zero in a loop...

[ Goes looking ]

>      39.35            -0.3       39.09        perf-profile.calltrace.cycles-pp.inode_sb_list_add.new_inode.shmem_get_inode.__shmem_file_setup.shmem_zero_setup

Ahh. It also does the mmap side, and the shared case ends up always
creating a new inode.

And while the test only tests *reading* and the mmap is read-only, the
/dev/zero file descriptor was opened for writing too, for a different
part of a test.

So even though the mapping is never written to, MAYWRITE is set, and
so the /dev/zero mapping is done as a shared memory mapping and we
can't do it as just a private one.

That's kind of stupid and looks unintentional, but whatever.

End result: that benchmark ends up being at least partly (and a fairly
noticeable part) a shmem setup benchmark, for no actual good reason.

Oh well. I certainly don't mind the removal apparently then also
helping some odd benchmark case, but I don't think this translates to
anything real. Very random.

                    Linus
