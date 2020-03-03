Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F0A96177A40
	for <lists+linux-mips@lfdr.de>; Tue,  3 Mar 2020 16:20:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729398AbgCCPUQ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 3 Mar 2020 10:20:16 -0500
Received: from mo4-p01-ob.smtp.rzone.de ([81.169.146.164]:26988 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729026AbgCCPUQ (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 3 Mar 2020 10:20:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1583248812;
        s=strato-dkim-0002; d=goldelico.com;
        h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=rKMD7BQOvvf2EnNvM4tQSBZbaPpVD8OTqQcL6Q0plyw=;
        b=g1EySrC0Ixnhoqm3wyXUEqSdTpbhbZ9bCrOUSuYfAVPAI4K3gfe9M5nYW/s9ltxSd/
        nENcQvFen70s4ikYiBtb2CoVKw9hjFm/55AVrFxRVpsIa67lbQ1eJw7ap9+SQdMsZ6EU
        2RPWNs+s7qCoO2lXU4waa+hOwyjcjXHEhitzssXbQFagmW6tJjtlsj4omoEasjF9XJGx
        zcc5hY2zShc4TqmwnZMhZFDRkyYcAMEG/DP+69Evuj8v7Di6yrbaNnoJOWi40bunSl8V
        n9XdGU238TsxVgLmbYWVWtzFhTcMJZzBwZ4Z2yYGj9fsQfXSy1sou8O5tRy8DQAw27Mf
        JxUQ==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj7wpz8NMGHPrpwDGvxw=="
X-RZG-CLASS-ID: mo00
Received: from imac.fritz.box
        by smtp.strato.de (RZmta 46.2.0 DYNA|AUTH)
        with ESMTPSA id y0a02cw23FJxJxq
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
        (Client did not present a certificate);
        Tue, 3 Mar 2020 16:19:59 +0100 (CET)
Subject: Re: [RFC 0/8] MIPS: CI20: add HDMI out support
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Content-Type: text/plain; charset=us-ascii
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <20200303145848.GA13796@bogus>
Date:   Tue, 3 Mar 2020 16:19:59 +0100
Cc:     Sam Ravnborg <sam@ravnborg.org>,
        Paul Cercueil <paul@crapouillou.net>,
        Paul Boddie <paul@boddie.org.uk>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Mark Rutland <mark.rutland@arm.com>,
        Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paulburton@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andi Kleen <ak@linux.intel.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        "Eric W. Biederman" <ebiederm@xmission.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
        linux-mips@vger.kernel.org,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Discussions about the Letux Kernel 
        <letux-kernel@openphoenux.org>
Content-Transfer-Encoding: 7bit
Message-Id: <6A9DD709-DF42-4A68-9EA4-A2F9C7A49DBA@goldelico.com>
References: <cover.1582744379.git.hns@goldelico.com> <20200227122325.GA7587@ravnborg.org> <8EE60F87-415A-44EA-AA49-632E232095FF@goldelico.com> <20200303145848.GA13796@bogus>
To:     Rob Herring <robh@kernel.org>
X-Mailer: Apple Mail (2.3124)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Rob,

> Am 03.03.2020 um 15:58 schrieb Rob Herring <robh@kernel.org>:
> 
> On Thu, Feb 27, 2020 at 01:56:56PM +0100, H. Nikolaus Schaller wrote:
>> Hi Sam,
>> 
>> 
>> Or that there will appear good tools soon. E.g. some GUI
>> based editor tool would be very helpful so that you don't have
>> to fight with the yaml indentation rules. Like there are XML
>> and DTD editors. And even HTML is rarely written manually any more.
>> 
>> IMHO such tools should have been developed and in place *before*
>> the rule to provide DT schemata is enforced.
> 
> You mean tools like what is discussed here:
> 
> https://www.redhat.com/sysadmin/yaml-tips
> 
> There's also yaml-format in the dtschema repo which will reformat a file 
> to the desired formatting. It is just a wrapper around ruamel yaml 
> library.

What I dream of is a higher level higher abstraction than a YAML
editor because the problems I face are not only YAML syntax but that
I don't know what should be where in a scheme file and why.

So I'd like to have a Schema editor. I.e. some editor where I
can edit a list of properties and can e.g. checkmark "required".
And simply type a description into some text field.

And the editor knows where to place the keywords -item -enum
-oneOf -description etc. when doing a Save operation.

Basically what I dream of is more like MarkDown where you write text,
titles paragraphs etc. and that gets magically translated into 
valid HTML. Or even better analogy: OpenOffice where you just
write and format your text and one does not have to edit PostScript
printer commands.

But it is likely to stay a dream.

BR and thanks,
Nikolaus

