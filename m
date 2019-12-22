Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0FABC128D79
	for <lists+linux-mips@lfdr.de>; Sun, 22 Dec 2019 11:46:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726190AbfLVKqY (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 22 Dec 2019 05:46:24 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:50256 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726189AbfLVKqY (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 22 Dec 2019 05:46:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1577011582;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=BbS/SraLV7W9+Kigv33qodrGuRZjCR+UJjm1tm4Wd3Y=;
        b=J6tL5d//URVNexhSjpatv3Hh0W2p74qiRPj/KnVhsgnP6pDZWvf9ByJZHARkn/e9htIL8J
        Y1lW1YMGKZ7WBZZ+2WeIye65JrSF2OzAhPjpB3JeKLDq5Z0B2B2cl4p9FPsNYTHqu0uoYa
        3sX7U8kHi0KVHnjz/lyuRSbvPh31wpc=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-208-isyuP5AqMjOyAXU1X9z7Ng-1; Sun, 22 Dec 2019 05:46:20 -0500
X-MC-Unique: isyuP5AqMjOyAXU1X9z7Ng-1
Received: by mail-wr1-f70.google.com with SMTP id h30so2678814wrh.5
        for <linux-mips@vger.kernel.org>; Sun, 22 Dec 2019 02:46:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=BbS/SraLV7W9+Kigv33qodrGuRZjCR+UJjm1tm4Wd3Y=;
        b=b28V5OBe/YOusS4laJ7r7hjrhLL8Y83uYSjBm/EoZVqDlntsTUl9FkN7mDSawrzNUi
         cIZ7E6FiWTjP63RbN+jhedG7OZwkSKncbxgG2wOznrP9HJnmZDWX9kJwPqekNcvbNcF1
         s25NR7NT0nnufaIgxnIo7ay129MphleGQkvoVWwUEZoPXblM2+IG5cESKHAL1+vBVpqJ
         Hs04uN5sSbMN8KWPFhH3yR5FJ86Is47TuWX8AM1G8vJponH6GGGES4XxZ06GzTt/DkNi
         Zv/vP2vNR+I6lpoVFemRj13YB17Uyvfc8WZmQ+eRCo7RVTsaA9iKG7YzSkKbpSl8YI0+
         rV0A==
X-Gm-Message-State: APjAAAVlZucmjklg3aa1OzYx7Bv3uTQlr95FnuXFjLAUEmuk1UGIRFpl
        niKgivN2cxNN+Z8t8YotrCOtGE8/HpCttLzDh2as7dT9tYtOmmoFR5n55/Q0PmNkZhq+7vn3/aZ
        b8EI6FdL6GRXNJHn7FhlF4Q==
X-Received: by 2002:a7b:cf26:: with SMTP id m6mr24625365wmg.17.1577011579050;
        Sun, 22 Dec 2019 02:46:19 -0800 (PST)
X-Google-Smtp-Source: APXvYqxEiX4VWTXOI53mxlk30oTDucDZUgIaRnuexHTgJaD/Reqh/MG0OUWxqiv7iMUeHJRC+MgISw==
X-Received: by 2002:a7b:cf26:: with SMTP id m6mr24625345wmg.17.1577011578838;
        Sun, 22 Dec 2019 02:46:18 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:7009:9cf0:6204:f570? ([2001:b07:6468:f312:7009:9cf0:6204:f570])
        by smtp.gmail.com with ESMTPSA id g21sm17499777wrb.48.2019.12.22.02.46.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 22 Dec 2019 02:46:18 -0800 (PST)
Subject: Re: [PATCH] MAINTAINERS: Orphan KVM for MIPS
To:     James Hogan <jhogan@kernel.org>,
        =?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <rkrcmar@redhat.com>,
        Paul Burton <paulburton@kernel.org>
Cc:     Ralf Baechle <ralf@linux-mips.org>, kvm@vger.kernel.org,
        linux-mips@vger.kernel.org
References: <20191221155013.49080-1-jhogan@kernel.org>
From:   Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <4ba9fcff-5088-e60f-11a8-f2d158dbf848@redhat.com>
Date:   Sun, 22 Dec 2019 11:46:23 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191221155013.49080-1-jhogan@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 21/12/19 16:50, James Hogan wrote:
> I haven't been active for 18 months, and don't have the hardware set up
> to test KVM for MIPS, so mark it as orphaned and remove myself as
> maintainer. Hopefully somebody from MIPS can pick this up.
> 
> Signed-off-by: James Hogan <jhogan@kernel.org>
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> Cc: "Radim Krčmář" <rkrcmar@redhat.com>
> Cc: Paul Burton <paulburton@kernel.org>
> Cc: Ralf Baechle <ralf@linux-mips.org>
> Cc: kvm@vger.kernel.org
> Cc: linux-mips@vger.kernel.org
> ---
>  MAINTAINERS | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 19d17815c0fb..010bb51bedcb 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -9074,9 +9074,8 @@ F:	virt/kvm/arm/
>  F:	include/kvm/arm_*
>  
>  KERNEL VIRTUAL MACHINE FOR MIPS (KVM/mips)
> -M:	James Hogan <jhogan@kernel.org>
>  L:	linux-mips@vger.kernel.org
> -S:	Supported
> +S:	Orphan
>  F:	arch/mips/include/uapi/asm/kvm*
>  F:	arch/mips/include/asm/kvm*
>  F:	arch/mips/kvm/
> 

Applied, adding kvm@vger.kernel.org to the lists as well.  Thanks for
your work!

Paolo

