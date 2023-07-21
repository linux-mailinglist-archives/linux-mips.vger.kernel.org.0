Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A0C7175D07B
	for <lists+linux-mips@lfdr.de>; Fri, 21 Jul 2023 19:18:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230398AbjGURSd (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 21 Jul 2023 13:18:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34468 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230386AbjGURSc (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 21 Jul 2023 13:18:32 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF87F198D
        for <linux-mips@vger.kernel.org>; Fri, 21 Jul 2023 10:17:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1689959863;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=kQftevPX0XUeLPrBO0NAWxPIrge3Hp6/1+H4UC+Ikhg=;
        b=jOullois1qXlg5Og+Hk4Cxtese+TCHcC8rw2CeBbTUYPjQg7FTnFa6SP0p+5V8JrHXT/da
        mdFJ8HQdnvBlcY9viQASyeBegU5sASkpq5ANhGB4LihO0dE487hh3CGC6sPdmnpAAuSMU7
        inuj12KMvP2UdGF5aE1s2CTQsTtq9hk=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-435-xmclmLNKMgeO4KYQKAKy-w-1; Fri, 21 Jul 2023 13:17:42 -0400
X-MC-Unique: xmclmLNKMgeO4KYQKAKy-w-1
Received: by mail-ed1-f69.google.com with SMTP id 4fb4d7f45d1cf-521a38098faso1345607a12.2
        for <linux-mips@vger.kernel.org>; Fri, 21 Jul 2023 10:17:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689959861; x=1690564661;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kQftevPX0XUeLPrBO0NAWxPIrge3Hp6/1+H4UC+Ikhg=;
        b=JJrg/XZDxjEKs6pes1800NvI01PljvX5aXT2c/UuZCmJlQiEJfGsXgNlgcz1hWC7qh
         H8gy07cB1PbTSnIrel/sTCqDs2Xxz5ZogJnXdmNjErjXNEFCeBIuw6dncaQo5Tq/JXBL
         u3CyvKxMXWt+Q57qqENiOQW60zQrImWIB3R/Jl6y8yQT31TpXwGPpb/OMXKWC8xqBpUf
         7yAomK/cYej1qsKGmXJkybEizlsfFsLmz+Zd7zW+a4+x3I7zR6HrCIwJNX6xWtol7dO1
         XjDC7B+FL/x0dcYd2LExgp6BFeMK/heEQ2ImPBo8icQ3RGD/tGLRCQK07FYYXtpRyjb1
         tLtg==
X-Gm-Message-State: ABy/qLZ5omUlSiUaPgz4K9RFbyhjqf/5nOdbROZjMglHRBQh2kOcIT3K
        But+cS6jFTWEW/6oArsY/OAVyAT9iMvUEWD54bY1O8hztlxpW9YzcI4BWdHYAGDzLYTbzCSIfiF
        loYXMPtp9px9z0djjRoKdGg==
X-Received: by 2002:aa7:c753:0:b0:51e:1a51:d414 with SMTP id c19-20020aa7c753000000b0051e1a51d414mr1878175eds.32.1689959861038;
        Fri, 21 Jul 2023 10:17:41 -0700 (PDT)
X-Google-Smtp-Source: APBJJlFyyf9U2FFYwtGg7Nfx7TqscSvBa0fBBUyOLoWSpgQImoylEzXmYhbWs/84TcbA6dVob4NtSg==
X-Received: by 2002:aa7:c753:0:b0:51e:1a51:d414 with SMTP id c19-20020aa7c753000000b0051e1a51d414mr1878159eds.32.1689959860744;
        Fri, 21 Jul 2023 10:17:40 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:9af8:e5f5:7516:fa89? ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
        by smtp.googlemail.com with ESMTPSA id l9-20020aa7c309000000b0051d87e72159sm2346640edq.13.2023.07.21.10.17.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Jul 2023 10:17:40 -0700 (PDT)
Message-ID: <8ad7a846-64e9-a3f1-4bf1-731a994d62cb@redhat.com>
Date:   Fri, 21 Jul 2023 19:17:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-US
To:     Sean Christopherson <seanjc@google.com>,
        Marc Zyngier <maz@kernel.org>,
        Oliver Upton <oliver.upton@linux.dev>,
        Huacai Chen <chenhuacai@kernel.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Anup Patel <anup@brainfault.org>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        "Matthew Wilcox (Oracle)" <willy@infradead.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Paul Moore <paul@paul-moore.com>,
        James Morris <jmorris@namei.org>,
        "Serge E. Hallyn" <serge@hallyn.com>
Cc:     kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        kvmarm@lists.linux.dev, linux-mips@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org,
        linux-riscv@lists.infradead.org, linux-fsdevel@vger.kernel.org,
        linux-mm@kvack.org, linux-security-module@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Chao Peng <chao.p.peng@linux.intel.com>,
        Fuad Tabba <tabba@google.com>,
        Jarkko Sakkinen <jarkko@kernel.org>,
        Yu Zhang <yu.c.zhang@linux.intel.com>,
        Vishal Annapurve <vannapurve@google.com>,
        Ackerley Tng <ackerleytng@google.com>,
        Maciej Szmigiero <mail@maciej.szmigiero.name>,
        Vlastimil Babka <vbabka@suse.cz>,
        David Hildenbrand <david@redhat.com>,
        Quentin Perret <qperret@google.com>,
        Michael Roth <michael.roth@amd.com>,
        Wang <wei.w.wang@intel.com>,
        Liam Merwick <liam.merwick@oracle.com>,
        Isaku Yamahata <isaku.yamahata@gmail.com>,
        "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
References: <20230718234512.1690985-1-seanjc@google.com>
 <20230718234512.1690985-13-seanjc@google.com>
From:   Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [RFC PATCH v11 12/29] KVM: Add KVM_CREATE_GUEST_MEMFD ioctl() for
 guest-specific backing memory
In-Reply-To: <20230718234512.1690985-13-seanjc@google.com>
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

On 7/19/23 01:44, Sean Christopherson wrote:
> +	inode = alloc_anon_inode(mnt->mnt_sb);
> +	if (IS_ERR(inode))
> +		return PTR_ERR(inode);
> +
> +	err = security_inode_init_security_anon(inode, &qname, NULL);
> +	if (err)
> +		goto err_inode;
> +

I don't understand the need to have a separate filesystem.  If it is to 
fully setup the inode before it's given a struct file, why not just 
export anon_inode_make_secure_inode instead of 
security_inode_init_security_anon?

Paolo

