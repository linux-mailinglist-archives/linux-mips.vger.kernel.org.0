Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E38366C5203
	for <lists+linux-mips@lfdr.de>; Wed, 22 Mar 2023 18:15:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230259AbjCVRPq (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 22 Mar 2023 13:15:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56736 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230483AbjCVRPn (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 22 Mar 2023 13:15:43 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 149B064878
        for <linux-mips@vger.kernel.org>; Wed, 22 Mar 2023 10:15:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1679505301;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=vBppRhOrRBmo4SnTGVUqBOXa70ZawMCQKN6tcvrZ2lw=;
        b=fGf3CWLdLciBbnc59toFTUP5wEwFZge+Fsh4bKIdy56hFfxb9ER32vvD5anmit81c4wh7W
        jHwrkvurPQVl+lSXw7OWTnjeeh9UhkW8e9jhOzP474mYQlkQX20/f3hikET6vA+qA5N70f
        vz1kIGWc2VRqWa7vAeGSt8PBbbMxzfQ=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-507-azoIymrlN8GeW2W6bwp7Hw-1; Wed, 22 Mar 2023 13:14:59 -0400
X-MC-Unique: azoIymrlN8GeW2W6bwp7Hw-1
Received: by mail-wm1-f70.google.com with SMTP id bi7-20020a05600c3d8700b003edecc610abso5237077wmb.7
        for <linux-mips@vger.kernel.org>; Wed, 22 Mar 2023 10:14:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679505298;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vBppRhOrRBmo4SnTGVUqBOXa70ZawMCQKN6tcvrZ2lw=;
        b=Nhrifof57NXI4uiASX3dsZ6XcJAmSVw1x4zmRSg9Is20kAL6a3Lijx9s/ghe6iJIKl
         hlI3Zkbp2M4Il7pYBFQaV7E6zpTh/oYrSW9oX5DXLbRtu895za4h+ldt9/P9t0/bhBdp
         8vnRlSSCJyoj8V7eNsFFMVxgxztup+kt28lswkcZduZhS80WQPEQt7UX/1xmq2C2U1G5
         pU3MloofiHz50EvftJg+SDGvDo4kvjqognLUlAD/OwCP74AW1blvPmGWHBc6eD0IRLZh
         KsI+VvBL+0oCTI3ZB5QmXAhOdbUbHrv0hysVnWv31r43KB8bhqCdZH0mV8G8E9vpkDyp
         XuJA==
X-Gm-Message-State: AAQBX9f+dOPjy7Sd7hgAZTzRsjykxhqOxwrQ05nHCyEekFDiYiGhowDd
        iolkfGEikeUiMuQ2SS8QCdqr65vTvHkvux1pMhpgck0Qeu2QkJUmWk6PNTXRZ6xxWfB7DO18tuw
        EvG28/Va4MJ06S+160wjtVg==
X-Received: by 2002:adf:eac3:0:b0:2d1:6104:76af with SMTP id o3-20020adfeac3000000b002d1610476afmr435264wrn.28.1679505297940;
        Wed, 22 Mar 2023 10:14:57 -0700 (PDT)
X-Google-Smtp-Source: AKy350YsyeX98944Y42ANtbCd1Si/fvtvfwMtr422hgZd2KEDMQKJqDia4iR2kzSJPSt4GGwSrvF0A==
X-Received: by 2002:adf:eac3:0:b0:2d1:6104:76af with SMTP id o3-20020adfeac3000000b002d1610476afmr435247wrn.28.1679505297615;
        Wed, 22 Mar 2023 10:14:57 -0700 (PDT)
Received: from ?IPV6:2003:cb:c703:d00:ca74:d9ea:11e0:dfb? (p200300cbc7030d00ca74d9ea11e00dfb.dip0.t-ipconnect.de. [2003:cb:c703:d00:ca74:d9ea:11e0:dfb])
        by smtp.gmail.com with ESMTPSA id e13-20020a056000120d00b002d7a75a2c20sm6918238wrx.80.2023.03.22.10.14.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Mar 2023 10:14:57 -0700 (PDT)
Message-ID: <f2729e78-bb8b-b1b7-7a5e-0e7d5075d33c@redhat.com>
Date:   Wed, 22 Mar 2023 18:14:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH] loongarch: drop ranges for definition of
 ARCH_FORCE_MAX_ORDER
Content-Language: en-US
To:     Mike Rapoport <rppt@kernel.org>,
        Huacai Chen <chenhuacai@kernel.org>,
        WANG Xuerui <kernel@xen0n.name>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
        "Kirill A. Shutemov" <kirill@shutemov.name>,
        linux-kernel@vger.kernel.org, linux-mm@kvack.org,
        linux-mips@vger.kernel.org
References: <20230322081727.2516291-1-rppt@kernel.org>
From:   David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20230322081727.2516291-1-rppt@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 22.03.23 09:17, Mike Rapoport wrote:
> From: "Mike Rapoport (IBM)" <rppt@kernel.org>
> 
> LoongArch defines insane ranges for ARCH_FORCE_MAX_ORDER allowing
> MAX_ORDER up to 63, which implies maximal contiguous allocation size of
> 2^63 pages.
> 
> Drop bogus definitions of ranges for ARCH_FORCE_MAX_ORDER and leave it a
> simple integer with sensible defaults.
> 
> Users that *really* need to change the value of ARCH_FORCE_MAX_ORDER
> will be able to do so but they won't be mislead by the bogus ranges.
> 
> Signed-off-by: Mike Rapoport (IBM) <rppt@kernel.org>
> ---
> 
> This applies to akpm/mm-unstable tree
> 
>   arch/loongarch/Kconfig | 3 ---
>   1 file changed, 3 deletions(-)
> 
> diff --git a/arch/loongarch/Kconfig b/arch/loongarch/Kconfig
> index 272a3a12c98d..e1e3a3828962 100644
> --- a/arch/loongarch/Kconfig
> +++ b/arch/loongarch/Kconfig
> @@ -420,11 +420,8 @@ config NODES_SHIFT
>   
>   config ARCH_FORCE_MAX_ORDER
>   	int "Maximum zone order"
> -	range 13 63 if PAGE_SIZE_64KB
>   	default "13" if PAGE_SIZE_64KB
> -	range 11 63 if PAGE_SIZE_16KB
>   	default "11" if PAGE_SIZE_16KB
> -	range 10 63
>   	default "10"
>   	help
>   	  The kernel memory allocator divides physically contiguous memory

Reviewed-by: David Hildenbrand <david@redhat.com>

-- 
Thanks,

David / dhildenb

