Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CF28B74B444
	for <lists+linux-mips@lfdr.de>; Fri,  7 Jul 2023 17:28:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232010AbjGGP2L (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 7 Jul 2023 11:28:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58832 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229695AbjGGP15 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 7 Jul 2023 11:27:57 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0CCBF212D
        for <linux-mips@vger.kernel.org>; Fri,  7 Jul 2023 08:27:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1688743627;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=+8qlgKJYI7kB6D1e5SNd04VHZ2yM21oq3nfTt/gANL8=;
        b=Xp3V7QpxR0t4kn3riQcIygCunUkXwI6NZ3Tna1R1/eSSKIttUgnUBIEMa0bUEAsweRM2gc
        U6nnWomAy9UZxVmI7MDDjcPICPUqvUyj2cWWhWFPcUxqtL/gbiqKCzm2QxuPCdKnlNpwQG
        VW5QSR7ucZvmaJXYRS7+9Gx7xwPi09M=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-75-ZDyvJjCFMfCKP1RODq72iQ-1; Fri, 07 Jul 2023 11:27:05 -0400
X-MC-Unique: ZDyvJjCFMfCKP1RODq72iQ-1
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-3fbb34f7224so12206385e9.2
        for <linux-mips@vger.kernel.org>; Fri, 07 Jul 2023 08:27:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688743624; x=1691335624;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+8qlgKJYI7kB6D1e5SNd04VHZ2yM21oq3nfTt/gANL8=;
        b=NhLFWMpOW26Hhye8yUYTbG58w/xxn544jPHGsKkAeify4uJi70AA6SvniCFZt8PTgO
         i9bCsfM+R7KBwIGL6cBOHt9XUDzg7M6cSpgq0jMElrDWEk3J1mtHWPnjswBUkTZYh2gq
         lK/ie2S0fGrPxVVyv7DMX9wraDQoCEghVue7N8hpLUIjaEbUOYlrtnFBQF3QI/NYqaCs
         XO5/W+EupKvJRNbvhXQOzdSEo/oI/mAWee4iSRaUUVbQk7yxSQJzzE5l6NYvABlACylM
         04/MdjJPaYaY2TP0du6VhwooiOslwS7SWCn3Bpw2cmL7ncjHCscpQ+NhSlypE6l32V8l
         Rf3A==
X-Gm-Message-State: ABy/qLYiTJaIk3OWVNuHsMGLZU+oJexlIkkGD7rek9xU8VDL+i+gfE74
        hMkBlw/Ckaru/GZOS6j6bz6wk+xs6O1tZ3dXk55F1jPmYRu6Pa1kLguOdrK6hIIkGmlDuneEHyM
        rQSZarCoIIkCy5epSHYpGvA==
X-Received: by 2002:adf:f052:0:b0:30a:a15d:eb2f with SMTP id t18-20020adff052000000b0030aa15deb2fmr4668085wro.3.1688743624748;
        Fri, 07 Jul 2023 08:27:04 -0700 (PDT)
X-Google-Smtp-Source: APBJJlGmxd1jbrrvV1R0iu/TeFKW/e1nuXfI0DnXijMIXAlyALphvzgzqltgfOe8J565vUOEzxyvoA==
X-Received: by 2002:adf:f052:0:b0:30a:a15d:eb2f with SMTP id t18-20020adff052000000b0030aa15deb2fmr4668074wro.3.1688743624480;
        Fri, 07 Jul 2023 08:27:04 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id bl1-20020adfe241000000b003143c9beeaesm4711005wrb.44.2023.07.07.08.27.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Jul 2023 08:27:04 -0700 (PDT)
From:   Javier Martinez Canillas <javierm@redhat.com>
To:     Arnd Bergmann <arnd@arndb.de>, Arnd Bergmann <arnd@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>
Cc:     linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
        Russell King <linux@armlinux.org.uk>,
        dri-devel@lists.freedesktop.org, Ard Biesheuvel <ardb@kernel.org>,
        Helge Deller <deller@gmx.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Richard Henderson <richard.henderson@linaro.org>,
        Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
        Matt Turner <mattst88@gmail.com>,
        Huacai Chen <chenhuacai@kernel.org>,
        WANG Xuerui <kernel@xen0n.name>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>, linux-alpha@vger.kernel.org,
        linux-ia64@vger.kernel.org, loongarch@lists.linux.dev,
        linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-riscv@lists.infradead.org
Subject: Re: [PATCH 2/4] vgacon: rework screen_info #ifdef checks
In-Reply-To: <ff9bfcfa-fa3b-42d2-b429-059b5103bce2@app.fastmail.com>
References: <20230707095415.1449376-1-arnd@kernel.org>
 <20230707095415.1449376-2-arnd@kernel.org>
 <87jzvbyh4p.fsf@minerva.mail-host-address-is-not-set>
 <ff9bfcfa-fa3b-42d2-b429-059b5103bce2@app.fastmail.com>
Date:   Fri, 07 Jul 2023 17:27:03 +0200
Message-ID: <87bkgnyc6w.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
Content-Type: text/plain
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

"Arnd Bergmann" <arnd@arndb.de> writes:

> On Fri, Jul 7, 2023, at 15:40, Javier Martinez Canillas wrote:

[...]

>> And this is only used by mdacon (not supported by ia64), vgacon and
>> vga16fb (not supported by ia64 either).
>>
>> So this could just be guarded just by CONFIG_VGA_CONSOLE for ia64 ?
>
> Right, I though about doing this more accurately, but in the end
> went for the simplest change rather than spending much more time
> trying to clean up the unused variables etc.
>
> Let me know if you'd prefer me to respin this part, otherwise
> I'd call the ia64 bit good enough for the purpose of the series.
>

No need to re-spin, agreed that makes sense to keep it simpler.

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

