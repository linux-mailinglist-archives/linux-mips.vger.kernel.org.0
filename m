Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BCDCF10C865
	for <lists+linux-mips@lfdr.de>; Thu, 28 Nov 2019 13:11:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726252AbfK1MLq (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 28 Nov 2019 07:11:46 -0500
Received: from mo4-p01-ob.smtp.rzone.de ([85.215.255.54]:34210 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726191AbfK1MLp (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 28 Nov 2019 07:11:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1574943103;
        s=strato-dkim-0002; d=goldelico.com;
        h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=DfCgOl5Ov657fyN9M2leKFqz1WkUc5AmijR2gH7rong=;
        b=DN5/xHz6GzN780lqwr77QS5pAPmIC7Qb6V7r5o1wlh532hLAIEc6WASVYrJTNCrnNx
        YNgTFUAfYCrqjPsNGG43hQ8Ot1BajkqNyt/LKoDK8E6S6bU7IuiWnZ5gD/nLyOIZlcrY
        lZGgxj5JypKPdew3QahHby8WqF2Nr/TJGWPm/05quN9aCtnanyfRDKzQputY/zugUo8v
        4PC+C0B0rCmR4xKjyE+p5sqW4LERjshxs4DzENP/lrjiiBW5OUlbjU+S1hSIF2ISj5WX
        vI9G3sBJVEINk+KABCqNVmNPyCestzPh1/zAOH/QK5RaCE+f/5siOL/eHEMB3B4cWsFB
        9Frw==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj4Qpw9iZeHmAiw43upSE="
X-RZG-CLASS-ID: mo00
Received: from imac.fritz.box
        by smtp.strato.de (RZmta 45.0.2 DYNA|AUTH)
        with ESMTPSA id y07703vASCBZJOe
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
        (Client did not present a certificate);
        Thu, 28 Nov 2019 13:11:35 +0100 (CET)
Content-Type: text/plain; charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Subject: Re: MIPS: bug: gettimeofday syscall broken on CI20 board
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <dbf536da-77a6-30a0-a380-9463f604d1a8@arm.com>
Date:   Thu, 28 Nov 2019 13:11:35 +0100
Cc:     Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paul.burton@mips.com>, linux-mips@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        MIPS Creator CI20 Development 
        <mips-creator-ci20-dev@googlegroups.com>,
        Discussions about the Letux Kernel 
        <letux-kernel@openphoenux.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <AD919A0B-2629-4E8A-8A7A-1E4A868F8BC4@goldelico.com>
References: <18788C50-F29B-4BD7-89F6-B056FF490214@goldelico.com> <703DC004-96E8-463D-8870-3CC410FE1C5E@goldelico.com> <3190d1a4-96c4-1843-3ae1-bae3a97af9fb@arm.com> <8D151C34-41A1-4DFE-92D6-D1B27AEC8730@goldelico.com> <dbf536da-77a6-30a0-a380-9463f604d1a8@arm.com>
To:     Vincenzo Frascino <vincenzo.frascino@arm.com>
X-Mailer: Apple Mail (2.3124)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org


> Am 28.11.2019 um 12:51 schrieb Vincenzo Frascino =
<vincenzo.frascino@arm.com>:
>=20
> Hi Nikolaus,
>=20
> On 27/11/2019 13:53, H. Nikolaus Schaller wrote:
> [...]
>=20
>>> vdso_data and mips_vdso_data before are not part of the ABI hence =
they are not
>>> bind by a contract with the userspace.
>>>=20
>>> This means that they can change at any point and if a userspace =
software relies
>>> on a specific layout of these data structures is doing something =
wrong.
>>=20
>> Maybe the libs are clever enough to find that out dynamically but I =
have no
>> idea about how gettimeofday() and user-space VDSO is implemented to =
handle such
>> changes.
>>=20
> As I said userspace applications and libraries should not rely on the =
layout of
> vdso_data because this is not part of the ABI.
>=20
> The only thing that userspace requires is to "know" that =
gettimeofday() exists,
> than it is gettimeofday() that internally accesses the data structure.

Well, with user-space I include the lib that provides the gettimeofday() =
syscall
and reads out the memory region where the VDSO data structure is =
provided by the
kernel. And that part comes from Debian. Somehow it does differently =
with 4.19
than 5.4. So I summarise all non-kernel code with the term "user-space".

BR,
Nikolaus

