Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 531D41307B
	for <lists+linux-mips@lfdr.de>; Fri,  3 May 2019 16:36:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727790AbfECOgk (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 3 May 2019 10:36:40 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:42273 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726376AbfECOgj (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 3 May 2019 10:36:39 -0400
Received: by mail-wr1-f65.google.com with SMTP id l2so8175020wrb.9;
        Fri, 03 May 2019 07:36:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:openpgp:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=9LOlOd4BnNhf1pDjGDrzR/ZKkfoXDSgbpZmiFhx/+So=;
        b=Hg2G70/IF42hwa2sC6gm/jdkqyjwPHSzvqPkqfP1jo0BUp6RNAnh5BIQm/+kAWYTW8
         91kQZlHD9Wfl0j/ZWV3Y5J2X70HDKI4N9yYIt5LqnfHnjyaFTxUbp8yeO5vlU4ytOTIq
         sGeAethRyn+cfdzPBCX297FcoC0C1YKqiNcVyyGRixQXPnbBwJFeyvrwMTTf8w0tv+T4
         vV9dT0FTqhNvEvfBYf9YYrjQn+KVqq76StJ3fI7jgWazxQ/rfFGgV0aG1EN7C2TCyxOo
         Kq3ScrICKPE1q3pCT/qoVllfBz8l/des4kRK22/UQ5a/Rs8cYRDXuX/raRqeVM2F2zqo
         LveQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=9LOlOd4BnNhf1pDjGDrzR/ZKkfoXDSgbpZmiFhx/+So=;
        b=IL3aO0mw9uc7IEle5vKz6F6kFd/W6ipGd98S+9+OTie5QUM/TnotTbpnEvmD7JTs91
         9RDmWGQtXYYdm039PsqHUbDZsHzJNLlQdY9xw407RuUyby0xplk8TctnOFaQR65Sc3VN
         0EaTIZykuNJnyU3yvxivQKZM23EiMwhT3764meMEvafFC6MFfbtVZVTBQLUXhsY1r0Br
         9Yv3ppsrRsywCkaudJh5L3y4RHr4DTZvnKfxi2UcLeQZkrK5QMWiEvcRNXT3HRgEmCnn
         oJkFX3z/I84OKlcg4X7rRxV9Hz9I2Xlx3QAWe9cohvzOvSgaBgaz2GkOJAnlQqYTzfkQ
         7Axg==
X-Gm-Message-State: APjAAAU+r1L+9ImqqAsECwBYCDjEf0qATGK8YOyuz46C9CUMUHixHw/Q
        Day00EqHCvYn9axqA45D0hs=
X-Google-Smtp-Source: APXvYqwPvEswxGgTxmceKzFYWP1rt3HvGjUS5zfk5glnnt2V0zX2AeQo2kgXS1/hJAMaI+XIGfIWqQ==
X-Received: by 2002:adf:b646:: with SMTP id i6mr7217752wre.12.1556894198184;
        Fri, 03 May 2019 07:36:38 -0700 (PDT)
Received: from [192.168.1.33] (193.red-88-21-103.staticip.rima-tde.net. [88.21.103.193])
        by smtp.gmail.com with ESMTPSA id o6sm3174417wre.60.2019.05.03.07.36.36
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Fri, 03 May 2019 07:36:37 -0700 (PDT)
Subject: Re: [PATCH 3/3] MIPS: BMIPS: add clock controller nodes
To:     Jonas Gorski <jonas.gorski@gmail.com>, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-mips@vger.kernel.org
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        bcm-kernel-feedback-list@broadcom.com,
        Kevin Cernekee <cernekee@gmail.com>,
        Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paul.burton@mips.com>,
        James Hogan <jhogan@kernel.org>
References: <20190502122657.15577-1-jonas.gorski@gmail.com>
 <20190502122657.15577-4-jonas.gorski@gmail.com>
From:   =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Message-ID: <ca21b81a-9772-039a-82be-e339f2a5ff16@amsat.org>
Date:   Fri, 3 May 2019 16:36:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190502122657.15577-4-jonas.gorski@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 5/2/19 2:26 PM, Jonas Gorski wrote:
> Now that we have a driver for the clock controller, add nodes to allow
> devices to make use of it.
> 
> Signed-off-by: Jonas Gorski <jonas.gorski@gmail.com>

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
