Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CADE14CFBF8
	for <lists+linux-mips@lfdr.de>; Mon,  7 Mar 2022 11:54:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241051AbiCGKzO (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 7 Mar 2022 05:55:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57798 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237479AbiCGKyn (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 7 Mar 2022 05:54:43 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id C5BF5A8ED9
        for <linux-mips@vger.kernel.org>; Mon,  7 Mar 2022 02:14:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1646647968;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=EAtJPNtZqQT+pzIC8Y0yY8ijMFQMxHJn+7uAlJm9E2A=;
        b=UZ+SDSnDZF+VsXQQefNOfVqNhUYEVXSyB5COW9cgKPDjqCDYYi63cbRm5MbY8glNzzlGYa
        x4DgPQWgUDEb/WE8ygjXLrXp0XGKTG+QHqXsj4YK3Y7s5SIJSsqIRDU2oEoAaqI/kFN7Ow
        YhYnq6VcqsKznBAzdBvLP4T1gcK9vzM=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-294-xOIGQxzDMviS3hzyGxVyyA-1; Mon, 07 Mar 2022 05:12:47 -0500
X-MC-Unique: xOIGQxzDMviS3hzyGxVyyA-1
Received: by mail-wm1-f72.google.com with SMTP id 20-20020a05600c231400b00389886f6b23so4433760wmo.6
        for <linux-mips@vger.kernel.org>; Mon, 07 Mar 2022 02:12:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:organization:in-reply-to
         :content-transfer-encoding;
        bh=EAtJPNtZqQT+pzIC8Y0yY8ijMFQMxHJn+7uAlJm9E2A=;
        b=Q3A5bQ5E535RkYmAP76LuIVSI4EEXnnZp8oe+vW7MCZeMJhz39fxFkw/Ca+YfY5quz
         GqttDE773dSZlKXrCVs8IdX1nvQ5LuGQ38PbcsgzpDhUaTVermXSuCjbAdm5Kfyk8Erd
         i6vUbO35CzjZ01QpBustbPMZHb8FRuKKfjETFHsCNpywB+TBxphW273XE4MuuCWCngyW
         hL6SpwpzdvXleK1pssfBKKkpFgns1PWg0h33cqkIpgi2hYV4aiKX2wAH5xjBXMo47LBH
         R6j9OcIZCwiziIFt8HUnZekT9zOz96GADgFbfFBm4vG3ujSuCs8CqCrosJbaiKiobXRB
         SYtw==
X-Gm-Message-State: AOAM531pEcyH6jcWAe1rUJZ3ggiSz7t3sntUxEIBQTnqnO56v6WKGrUO
        P/locvXaaihb+FstUaWv44/0QHWj/a5vd5T5DLTHp3GOnHX0ImtJWIJUmBqnXPo285TxRj2CYgL
        JMLB7uSwHOm1Ti9JF5zFDpA==
X-Received: by 2002:a5d:6046:0:b0:1f0:4973:142f with SMTP id j6-20020a5d6046000000b001f04973142fmr7674901wrt.538.1646647966508;
        Mon, 07 Mar 2022 02:12:46 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwEV99RC6J+Vin5f1sKjrk/pcIneCd29UN8hGV1eMibccSf0NvkVF1D5zaL4pxEGhCcclmMGQ==
X-Received: by 2002:a5d:6046:0:b0:1f0:4973:142f with SMTP id j6-20020a5d6046000000b001f04973142fmr7674887wrt.538.1646647966292;
        Mon, 07 Mar 2022 02:12:46 -0800 (PST)
Received: from ?IPV6:2003:cb:c705:1e00:8d67:f75a:a8ae:dc02? (p200300cbc7051e008d67f75aa8aedc02.dip0.t-ipconnect.de. [2003:cb:c705:1e00:8d67:f75a:a8ae:dc02])
        by smtp.gmail.com with ESMTPSA id bg18-20020a05600c3c9200b0037c2ef07493sm14954074wmb.3.2022.03.07.02.12.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Mar 2022 02:12:45 -0800 (PST)
Message-ID: <d6b09f23-f470-c119-8d3e-7d72a3448b64@redhat.com>
Date:   Mon, 7 Mar 2022 11:12:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH RFC 0/3] MAP_POPULATE for device memory
Content-Language: en-US
To:     Jarkko Sakkinen <jarkko@kernel.org>, linux-mm@kvack.org
Cc:     Dave Hansen <dave.hansen@linux.intel.com>,
        Nathaniel McCallum <nathaniel@profian.com>,
        Reinette Chatre <reinette.chatre@intel.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        linux-sgx@vger.kernel.org, linux-kernel@vger.kernel.org,
        Florian Fainelli <f.fainelli@gmail.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Matthew Auld <matthew.auld@intel.com>,
        =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= 
        <thomas.hellstrom@linux.intel.com>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        Jason Ekstrand <jason@jlekstrand.net>,
        Chris Wilson <chris@chris-wilson.co.uk>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
        Vasily Averin <vvs@virtuozzo.com>,
        Shakeel Butt <shakeelb@google.com>,
        Michal Hocko <mhocko@suse.com>,
        zhangyiru <zhangyiru3@huawei.com>,
        Alexey Gladkov <legion@kernel.org>,
        Alexander Mikhalitsyn <alexander.mikhalitsyn@virtuozzo.com>,
        linux-mips@vger.kernel.org, intel-gfx@lists.freedesktop.org,
        dri-devel@lists.freedesktop.org, codalist@coda.cs.cmu.edu,
        linux-unionfs@vger.kernel.org, linux-fsdevel@vger.kernel.org
References: <20220306053211.135762-1-jarkko@kernel.org>
From:   David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20220306053211.135762-1-jarkko@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 06.03.22 06:32, Jarkko Sakkinen wrote:
> For device memory (aka VM_IO | VM_PFNMAP) MAP_POPULATE does nothing. Allow
> to use that for initializing the device memory by providing a new callback
> f_ops->populate() for the purpose.
> 
> SGX patches are provided to show the callback in context.
> 
> An obvious alternative is a ioctl but it is less elegant and requires
> two syscalls (mmap + ioctl) per memory range, instead of just one
> (mmap).

What about extending MADV_POPULATE_READ | MADV_POPULATE_WRITE to support
VM_IO | VM_PFNMAP (as well?) ?


-- 
Thanks,

David / dhildenb

