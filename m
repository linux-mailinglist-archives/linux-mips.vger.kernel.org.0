Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2EDA77671A5
	for <lists+linux-mips@lfdr.de>; Fri, 28 Jul 2023 18:14:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230263AbjG1QOX (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 28 Jul 2023 12:14:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56764 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229752AbjG1QOS (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 28 Jul 2023 12:14:18 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E41FF30DA
        for <linux-mips@vger.kernel.org>; Fri, 28 Jul 2023 09:13:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1690560812;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=1Dyh7+qatvQDKM5qDRHq8YkO5TCQeLww3uN1vYmzEUU=;
        b=EzFo3gQj5XQ/9hIaortrhTD4LYBvIArNQeuoEUMjFSmK9OVj9+r5R7l037EK/2lLnNq90Z
        iCl5HGQAazJ5SxihMyCGgtE/1fNg8e8aP6nCISlzVK2BY7YZYcv/jQY5OtVem140TIuwGZ
        xjSysc4LiYaO9KBdfIkJceHnTkWpOxw=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-534-fmSxBUKRPjSDxCaBf58AOg-1; Fri, 28 Jul 2023 12:13:30 -0400
X-MC-Unique: fmSxBUKRPjSDxCaBf58AOg-1
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-94a355cf318so136858266b.2
        for <linux-mips@vger.kernel.org>; Fri, 28 Jul 2023 09:13:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690560809; x=1691165609;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1Dyh7+qatvQDKM5qDRHq8YkO5TCQeLww3uN1vYmzEUU=;
        b=HnAiw26bHvzRfTL/UlaPagGu/GychDGi4UKPSRXIu4WZbnZ9O20KBRyVhnwTBkQSmI
         C99K6/KabhfqKbtH15UECdX8ZPjpohU7sBmZHwPetVfzaArvzT/XucALq4cn4NDvrSrJ
         eN34P2xdBwFAqN+mUc7pTg4PfXpOnRcOnjCtHqC7R4fD6vGMIRzGyHFPAZme6dLDpklO
         rl1/8NgDS3MxPc52I/CGaaPWnEExnYvf0R3VllTRzKK8wqrEQsaVXA1V8kpK+AeXtgrB
         dVtAXzojIqKrCkP9TrpGQqD/eOdPxsAYaSSKHFZx4qAf8MQEVP5wVygnu2isZ52Quenw
         y3zg==
X-Gm-Message-State: ABy/qLbv/5KmIkrNekamzVJBxLrJJqY9hK+Qs6rOrDSZ+w2UCOVGlZJN
        LURkqh69/6TA5QyjYSaJ+Qcj0mu2bA9yVpW1ZLg9O0tMzCm0yu0a09S7T+YoDtdI9VrMFrTD1Xq
        v7dtyIl0DiAa6H2lUTMt22Q==
X-Received: by 2002:a17:906:5354:b0:99b:efd3:3dcc with SMTP id j20-20020a170906535400b0099befd33dccmr1357367ejo.62.1690560809632;
        Fri, 28 Jul 2023 09:13:29 -0700 (PDT)
X-Google-Smtp-Source: APBJJlHd2sX/AyGtIAscRR2p4pTksaGOsuCTBRQ37WpaEGChaEB1fcJtjozFJjrwhV4jFSHGD+pttg==
X-Received: by 2002:a17:906:5354:b0:99b:efd3:3dcc with SMTP id j20-20020a170906535400b0099befd33dccmr1357325ejo.62.1690560809219;
        Fri, 28 Jul 2023 09:13:29 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:9af8:e5f5:7516:fa89? ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
        by smtp.googlemail.com with ESMTPSA id gy26-20020a170906f25a00b00993470682e5sm2197928ejb.32.2023.07.28.09.13.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Jul 2023 09:13:28 -0700 (PDT)
Message-ID: <6da710cf-2bc0-bb6e-26f1-fba14ca767db@redhat.com>
Date:   Fri, 28 Jul 2023 18:13:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [RFC PATCH v11 10/29] mm: Add AS_UNMOVABLE to mark mapping as
 completely unmovable
Content-Language: en-US
To:     Vlastimil Babka <vbabka@suse.cz>,
        Matthew Wilcox <willy@infradead.org>,
        "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
Cc:     Sean Christopherson <seanjc@google.com>,
        Marc Zyngier <maz@kernel.org>,
        Oliver Upton <oliver.upton@linux.dev>,
        Huacai Chen <chenhuacai@kernel.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Anup Patel <anup@brainfault.org>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Andrew Morton <akpm@linux-foundation.org>,
        Paul Moore <paul@paul-moore.com>,
        James Morris <jmorris@namei.org>,
        "Serge E. Hallyn" <serge@hallyn.com>, kvm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
        linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org,
        linux-fsdevel@vger.kernel.org, linux-mm@kvack.org,
        linux-security-module@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Chao Peng <chao.p.peng@linux.intel.com>,
        Fuad Tabba <tabba@google.com>,
        Jarkko Sakkinen <jarkko@kernel.org>,
        Yu Zhang <yu.c.zhang@linux.intel.com>,
        Vishal Annapurve <vannapurve@google.com>,
        Ackerley Tng <ackerleytng@google.com>,
        Maciej Szmigiero <mail@maciej.szmigiero.name>,
        David Hildenbrand <david@redhat.com>,
        Quentin Perret <qperret@google.com>,
        Michael Roth <michael.roth@amd.com>,
        Wang <wei.w.wang@intel.com>,
        Liam Merwick <liam.merwick@oracle.com>,
        Isaku Yamahata <isaku.yamahata@gmail.com>
References: <20230718234512.1690985-1-seanjc@google.com>
 <20230718234512.1690985-11-seanjc@google.com>
 <20230725102403.xywjqlhyqkrzjok6@box.shutemov.name>
 <ZL/Fa4W2Ne9EVxoh@casper.infradead.org>
 <692b09f7-70d9-1119-7fe2-3e7396ec259d@suse.cz>
From:   Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <692b09f7-70d9-1119-7fe2-3e7396ec259d@suse.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 7/28/23 18:02, Vlastimil Babka wrote:
>> There's even a comment to that effect later on in the function:
> Hmm, well spotted. But it wouldn't be so great if we now had to lock every
> inspected page (and not just dirty pages), just to check the AS_ bit.
> 
> But I wonder if this is leftover from previous versions. Are the guest pages
> even PageLRU currently? (and should they be, given how they can't be swapped
> out or anything?) If not, isolate_migratepages_block will skip them anyway.

No, they're not (migration or even swap-out is not excluded for the 
future, but for now it's left for future work.

Paolo

