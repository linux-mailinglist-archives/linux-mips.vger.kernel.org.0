Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AE5E925F45C
	for <lists+linux-mips@lfdr.de>; Mon,  7 Sep 2020 09:55:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726978AbgIGHzA (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 7 Sep 2020 03:55:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38596 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726928AbgIGHy7 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 7 Sep 2020 03:54:59 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 259DFC061573;
        Mon,  7 Sep 2020 00:54:57 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id w3so14954781ljo.5;
        Mon, 07 Sep 2020 00:54:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=oxTHjh1zNMWPixGwv13o2dUs7ZZwfDMzVlmU7JDWG3Y=;
        b=E53XJkJOmN5guMgDFVv3DZ5Zzaq5i+3joqcb2qcyx+851toFmeNGtNUJAUpM6Xe89o
         afojPeQoUtASLKTzzSaxNevXYgH3hbzHcEX99F5PQjhITNLKRuxUDzV7Ez+Rrh1/yCvy
         NHIY5sP0nKPJ2urab9tksk6Kb2JeL/r8WV/iybRwcFTSNg4vtNah7LB9TG8Zt1h5Dxl9
         ns1mNJCJtGA42N93Ey6k8NYXldxy2c7sq492eb7Z+7Vb46E5dtqXC55pC6viR19iJWiT
         0Q2VYa9L20fg10ArVTNcAm/sorHtOHbtPBAbc4fJxXX4qcsa8uqmbBZBjoKIrbpIhOVk
         WINw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=oxTHjh1zNMWPixGwv13o2dUs7ZZwfDMzVlmU7JDWG3Y=;
        b=UZSozbG/HXnXq6AIs/b/HDKOyVrydBJ/q2X1ugFNCk3Gh5nRoHsA7cuQqHRuXu9EtY
         +cbzoaUjz67wfDZlN1LCVOgF0EcbLRtlMXgMyi+YjQaP2EgB8DTlse6c6FduELeVXk2s
         QmsD8WF41o/nszn/7XlbUeSYzBOUcK9Fpzra9fBffUInz+Zs5kf1Y2jNuUz1wi/T6hQb
         7mHGQdglAmCQyK1SagQTO83vLDQEj7D7AKOswIBG6CM/asMc4m6UhDHTOvpHZq3wAeRg
         jv/rIKt5DaeMBTlaFMQhx0tsM+GM9n9vMumYWCXV0w/eJ/KxI/T3G9jz6T5V9Ryut9K4
         gAZQ==
X-Gm-Message-State: AOAM532jj1CclJkanCW3E0MpMxHH23UyWqa2OhioGlb8nYwcv/uZAuOF
        gDWTwLtDuFXxkOiKANkiMXffhqTBzws=
X-Google-Smtp-Source: ABdhPJxM4IMr1KC18yRmbL+vzthftE54V4C03XiZrCs2RdJOlUcAueIaJjDx+da2MAQABfIXCjoXDQ==
X-Received: by 2002:a2e:e1a:: with SMTP id 26mr7880286ljo.377.1599465296016;
        Mon, 07 Sep 2020 00:54:56 -0700 (PDT)
Received: from ?IPv6:2a00:1fa0:6a2:89f3:b416:2a89:c3ba:d276? ([2a00:1fa0:6a2:89f3:b416:2a89:c3ba:d276])
        by smtp.gmail.com with ESMTPSA id b11sm6699023lfo.66.2020.09.07.00.54.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Sep 2020 00:54:55 -0700 (PDT)
Subject: Re: [PATCH v3 08/15] MIPS: generic: Support booting with built-in or
 appended DTB
To:     Paul Cercueil <paul@crapouillou.net>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     "Maciej W . Rozycki" <macro@linux-mips.org>,
        Paul Burton <paulburton@kernel.org>,
        Zhou Yanjie <zhouyanjie@wanyeetech.com>, od@zcrc.me,
        linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org
References: <20200906192935.107086-1-paul@crapouillou.net>
 <20200906192935.107086-9-paul@crapouillou.net>
From:   Sergei Shtylyov <sergei.shtylyov@gmail.com>
Organization: Brain-dead Software
Message-ID: <0e65a59d-74ad-f521-5728-62a4ae58b7fe@gmail.com>
Date:   Mon, 7 Sep 2020 10:54:52 +0300
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200906192935.107086-9-paul@crapouillou.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 06.09.2020 22:29, Paul Cercueil wrote:

> The plat_get_fdt() checked that the kernel was booted using UHI before
> reading the 'fw_passed_dtb' variable. However, this variable is also set
> when the kernel has been appended, or when it has been built into the

    You haven't fixed s/kernel/DT/ here... :-/

> kernel.
> 
> Support these usecases by removing the UHI check.
> 
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
[...]

MBR, Sergei
