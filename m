Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B5E1E1F4AB4
	for <lists+linux-mips@lfdr.de>; Wed, 10 Jun 2020 03:11:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725885AbgFJBLq (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 9 Jun 2020 21:11:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53344 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725798AbgFJBLp (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 9 Jun 2020 21:11:45 -0400
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E460C05BD1E;
        Tue,  9 Jun 2020 18:11:43 -0700 (PDT)
Received: by mail-pg1-x542.google.com with SMTP id r10so212985pgv.8;
        Tue, 09 Jun 2020 18:11:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=JUXFIpAZNhLOKFb21Ru5xbanffFal9dLZ6uEHtJQTz4=;
        b=BIo+ES8jhdKEvHJb4WeWrTnqAuloMz7BJ7pkt7ZsUstmVJESP+UhHAsntts/SGJ/4C
         fAnqr64AWBvkL7hs4e+bD15uOIzgzp9p8KbZeB1RB7EGOb+9JoitlkhE+1UvcvIi1Bqe
         zpRMMS66kb6xP5o0nif7/aItjg8d4tmYX5raxO3GJ5i+cOetj8Y19Yaqb2MHEar6MyQY
         3R2F60FTYYjEBsmz2IGjyMROyhF8mDSOoII5w6TW4lXTrB9KgBRDUfQVEfUq++UjfafY
         RY0e2s8WeQhESPsacn6QW0pizTeYUdr9ArZcaOxbNBh5QLx5hs5FPc4Wz1ufE0OtGr86
         8y4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=JUXFIpAZNhLOKFb21Ru5xbanffFal9dLZ6uEHtJQTz4=;
        b=e0ev2Dm+e1+6qXgsswIJQqW8v6eiB1MsvUOLdivjlW1A0NdpJSBPIbBX3QLrtaO2wa
         nhyn2BfIu7BFD+FMw5S//YXBi8e4zxgDmpgcrADK7VCHbpTfguHEf7vTvK89lQbx2FOB
         KKEvPRyQP15MqIzIIl7q/O9yhXVGsaIMKqH9Ci2gTrfDXLXUBz30rfn9j6xxARk/S7oU
         oLt+pAwpPj05GHB1Zy5LS4+z+d6U/jcpKM2kL8kK1U/lTymbHUSQ0x3MO6r94pL5OQQv
         7Fb+/I4+w8Q8rkvS9Er4hsY+Dj7bVXnavzu6tyxLHHq4BOreUXYLbqeCi16AJfAqHpY6
         qWqw==
X-Gm-Message-State: AOAM532MEQ8vXAHXYxUDPN8cuNcrCRiHCGd0M8f3x5esq2lqXk6BRXc4
        4HIB32qmZrf4X8rOPVIknwA=
X-Google-Smtp-Source: ABdhPJx66/JbYr7Qvtbsf0ncqiiEOw8ap+m0Rzt1aEKjKN9mwOa53uaoI275IGjAZq7Rs+Z/exeBdg==
X-Received: by 2002:aa7:952d:: with SMTP id c13mr480416pfp.125.1591751502698;
        Tue, 09 Jun 2020 18:11:42 -0700 (PDT)
Received: from [10.230.188.43] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 136sm11013973pfa.152.2020.06.09.18.11.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jun 2020 18:11:42 -0700 (PDT)
Subject: Re: [PATCH v2 2/7] dt-bindings: reset: add BCM6345 reset controller
 bindings
To:     =?UTF-8?Q?=c3=81lvaro_Fern=c3=a1ndez_Rojas?= <noltari@gmail.com>,
        p.zabel@pengutronix.de, robh+dt@kernel.org,
        tsbogend@alpha.franken.de, jonas.gorski@gmail.com,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mips@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com
References: <20200609134232.4084718-1-noltari@gmail.com>
 <20200609160244.4139366-1-noltari@gmail.com>
 <20200609160244.4139366-3-noltari@gmail.com>
From:   Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <e1266c58-958a-57bd-e4a3-b63867960614@gmail.com>
Date:   Tue, 9 Jun 2020 18:11:40 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Firefox/68.0 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200609160244.4139366-3-noltari@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



On 6/9/2020 9:02 AM, Álvaro Fernández Rojas wrote:
> Add support for resetting blocks through the Linux reset controller
> subsystem for BCM63xx SoCs.

The commit message should be paraphrasing part of your binding content,
not necessarily describing why this is useful.

This looks good to me though:

Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
-- 
Florian
