Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C837441974B
	for <lists+linux-mips@lfdr.de>; Mon, 27 Sep 2021 17:07:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234865AbhI0PIq (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 27 Sep 2021 11:08:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:28978 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234994AbhI0PIp (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Mon, 27 Sep 2021 11:08:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1632755227;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=H2YLjPWLjDxhksfVJJ0b+TgzS3sQ4uenpZKkXE6cLl8=;
        b=Vuq9HxLgQlfj9bP7NfiSyHCmpHTUMswo7Ijerr+14A94Ln9wkpFBqxZEBlQjirzTHX0T/d
        r4KL5Y0EAK1vuIv09zmr1VmIvGMzCm2RfXRCo0yf0ZF6KU/IgVAYuXVzncZWmeQy+UicuJ
        0wjd0vXR85f6FqtqNqeZIbrSe0fcia8=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-557-UQ_ZctL4P5KJFyYDbzY4lQ-1; Mon, 27 Sep 2021 11:07:06 -0400
X-MC-Unique: UQ_ZctL4P5KJFyYDbzY4lQ-1
Received: by mail-wm1-f72.google.com with SMTP id k5-20020a7bc3050000b02901e081f69d80so362946wmj.8
        for <linux-mips@vger.kernel.org>; Mon, 27 Sep 2021 08:07:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=H2YLjPWLjDxhksfVJJ0b+TgzS3sQ4uenpZKkXE6cLl8=;
        b=ei9UBFH26WQphFqFF3e44j8K28koR8pgb2ZwaoOi/YMjojfdy92WMxfz5ujNQV7BOD
         712o9YElVQ1eA5PMA7G8+K+DVxnZ3leXEBhs0f6ZPdhRvz3/75rhKN721pf3p/L0bUjJ
         dgsLOXoAiGoGLMP0ey9NsJaqRY7NOS6uH3HVp2wJ/K61NHz8Po7Kg9TrsSiqhbMxRp1a
         rpD0r15Y+o/pa0QwOtWxSZvVulodZZNzQoF9dKDF2h2yJuxjWI7mDL1s7Kx7sPwJkWZL
         eomZ5+iC4ccHW1/XFrqvJldVQL2fSTUmDmGGeWQ1MrZLwNTS5ArELV/Jg+8F7H9rIhgX
         uC6A==
X-Gm-Message-State: AOAM533kxAiUeciE3073xOyAO9QPzy4lv+R+PzQINPhM9N93nPTiA6AR
        S7fJAygsmr03w/be+7NF3bgt4wKhGowdtXNH4hz7BrkYQ6EzQMbJHBwNx3M0AQO5yhn6ebDnMBT
        V9EAL+6kD3ljj1FFqoyM8vg==
X-Received: by 2002:a5d:590a:: with SMTP id v10mr361557wrd.87.1632755224887;
        Mon, 27 Sep 2021 08:07:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyy5wlKXLyU5BWf9WD/reu/rSzNLdsCLGLJ2WCZuEX7Xkvd9O/Z0HH1Erkz7+dZr/KU55FrDA==
X-Received: by 2002:a5d:590a:: with SMTP id v10mr361519wrd.87.1632755224672;
        Mon, 27 Sep 2021 08:07:04 -0700 (PDT)
Received: from [192.168.3.132] (p5b0c654d.dip0.t-ipconnect.de. [91.12.101.77])
        by smtp.gmail.com with ESMTPSA id f9sm284908wmf.3.2021.09.27.08.07.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Sep 2021 08:07:04 -0700 (PDT)
Subject: Re: [PATCH v1 0/4] mm/memory_hotplug: full support for
To:     linux-kernel@vger.kernel.org
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Mike Rapoport <rppt@kernel.org>,
        Michal Hocko <mhocko@suse.com>,
        Oscar Salvador <osalvador@suse.de>,
        Jianyong Wu <Jianyong.Wu@arm.com>,
        "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>,
        Vineet Gupta <vgupta@kernel.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Huacai Chen <chenhuacai@kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Heiko Carstens <hca@linux.ibm.com>,
        Vasily Gorbik <gor@linux.ibm.com>,
        Christian Borntraeger <borntraeger@de.ibm.com>,
        Eric Biederman <ebiederm@xmission.com>,
        Arnd Bergmann <arnd@arndb.de>,
        linux-snps-arc@lists.infradead.org, linux-ia64@vger.kernel.org,
        linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
        linux-s390@vger.kernel.org, linux-mm@kvack.org,
        kexec@lists.infradead.org
References: <20210927150518.8607-1-david@redhat.com>
From:   David Hildenbrand <david@redhat.com>
Organization: Red Hat
Message-ID: <d7d4ec92-7b9c-f466-6d3c-cfdd162d1dbf@redhat.com>
Date:   Mon, 27 Sep 2021 17:07:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210927150518.8607-1-david@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Intended subject was "[PATCH v1 0/4] mm/memory_hotplug: full support for 
add_memory_driver_managed() with CONFIG_ARCH_KEEP_MEMBLOCK"

-- 
Thanks,

David / dhildenb

